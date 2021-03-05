package es.inteco.rastreador2.dao.observatorio;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.codec.binary.Base64;

import es.inteco.common.logging.Logger;
import es.inteco.common.utils.StringUtils;
import es.inteco.rastreador2.actionform.observatorio.TemplateRangeForm;
import es.inteco.rastreador2.dao.etiqueta.EtiquetaDAO;
import es.inteco.rastreador2.utils.DAOUtils;

/**
 * The Class RangeDAO.
 */
public class TemplateRangeDAO {
	/**
	 * Count.
	 *
	 * @param c      the c
	 * @param nombre the nombre
	 * @return the int
	 * @throws SQLException the SQL exception
	 */
	public static int count(Connection c, String nombre, final Long idExObs) throws SQLException {
		int count = 1;
		String query = "SELECT COUNT(*) FROM observatorio_template_range e WHERE 1=1 AND id_observatory_execution = ? ";
		if (StringUtils.isNotEmpty(nombre)) {
			query += " AND UPPER(e.name) like UPPER(?) ";
		}
		try (PreparedStatement ps = c.prepareStatement(query)) {
			ps.setLong(count++, idExObs);
			if (StringUtils.isNotEmpty(nombre)) {
				ps.setString(count++, "%" + nombre + "%");
			}
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					return rs.getInt(1);
				} else {
					return 0;
				}
			}
		} catch (SQLException e) {
			Logger.putLog("SQL Exception: ", EtiquetaDAO.class, Logger.LOG_LEVEL_ERROR, e);
			throw e;
		}
	}

	/**
	 * Gets the etiquetas.
	 *
	 * @param c the c
	 * @return the etiquetas
	 * @throws SQLException the SQL exception
	 */
	public static List<TemplateRangeForm> findAll(Connection c, final Long idExObs) throws SQLException {
		final List<TemplateRangeForm> results = new ArrayList<>();
		String query = "SELECT id, name, min_value, max_value, min_value_operator, max_value_operator, template FROM observatorio_template_range WHERE 1=1 AND id_observatory_execution = ? ORDER BY UPPER(name) ASC, UPPER(name) ASC";
		try (PreparedStatement ps = c.prepareStatement(query)) {
			ps.setLong(1, idExObs);
			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					final TemplateRangeForm form = new TemplateRangeForm();
					form.setId(rs.getLong("id"));
					form.setName(rs.getString("name"));
					form.setMinValue(rs.getFloat("min_value"));
					form.setMaxValue(rs.getFloat("max_value"));
					form.setMinValueOperator(rs.getString("min_value_operator"));
					form.setMaxValueOperator(rs.getString("max_value_operator"));
					form.setTemplate(new String(Base64.decodeBase64(rs.getString("template").getBytes())));
					results.add(form);
				}
			}
		} catch (SQLException e) {
			Logger.putLog("SQL Exception: ", EtiquetaDAO.class, Logger.LOG_LEVEL_ERROR, e);
			throw e;
		}
		return results;
	}

	/**
	 * Save.
	 *
	 * @param c    the c
	 * @param form the form
	 * @throws SQLException                 the SQL exception
	 * @throws UnsupportedEncodingException the unsupported encoding exception
	 */
	public static void save(Connection c, final TemplateRangeForm form) throws SQLException, UnsupportedEncodingException {
		PreparedStatement ps = null;
		try {
			c.setAutoCommit(false);
			ps = c.prepareStatement(
					"INSERT INTO observatorio_template_range(name, min_value, max_value, min_value_operator, max_value_operator,template,id_observatory_execution) VALUES (?,?,?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, form.getName());
			ps.setFloat(2, form.getMinValue());
			ps.setFloat(3, form.getMaxValue());
			ps.setString(4, form.getMinValueOperator());
			ps.setString(5, form.getMaxValueOperator());
			// Encode BASE64 code
			String template = new String(form.getTemplate());
			if (!StringUtils.isEmpty(template)) {
				template = new String(Base64.encodeBase64(template.getBytes("UTF-8")));
			}
			ps.setString(6, template);
			ps.setLong(7, form.getIdObservatoryExecution());
			int affectedRows = ps.executeUpdate();
			if (affectedRows == 0) {
				throw new SQLException("Creating range failed, no rows affected.");
			}
			c.commit();
		} catch (SQLException e) {
			c.rollback();
			Logger.putLog("SQL_EXCEPTION: ", TemplateRangeDAO.class, Logger.LOG_LEVEL_ERROR, e);
			throw e;
		} finally {
			DAOUtils.closeQueries(ps, null);
		}
	}

	/**
	 * Update.
	 *
	 * @param c    the c
	 * @param form the form
	 * @throws SQLException                 the SQL exception
	 * @throws UnsupportedEncodingException the unsupported encoding exception
	 */
	public static void update(Connection c, final TemplateRangeForm form) throws SQLException, UnsupportedEncodingException {
		final String query = "UPDATE observatorio_template_range SET name = ?, min_value = ?, max_value = ?, min_value_operator = ?, max_value_operator = ?, template = ? WHERE id = ?";
		try (PreparedStatement ps = c.prepareStatement(query)) {
			ps.setString(1, form.getName());
			ps.setFloat(2, form.getMinValue());
			ps.setFloat(3, form.getMaxValue());
			ps.setString(4, form.getMinValueOperator());
			ps.setString(5, form.getMaxValueOperator());
			// Encode BASE64 code
			String template = new String(form.getTemplate());
			if (!StringUtils.isEmpty(template)) {
				template = new String(Base64.encodeBase64(template.getBytes("UTF-8")));
			}
			ps.setString(6, template);
			ps.setLong(7, form.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			Logger.putLog("SQL Exception: ", TemplateRangeDAO.class, Logger.LOG_LEVEL_ERROR, e);
			throw e;
		}
	}

	/**
	 * Delete etiqueta.
	 *
	 * @param c  the c
	 * @param id the id
	 * @throws SQLException the SQL exception
	 */
	public static void delete(Connection c, final Long id) throws SQLException {
		try (PreparedStatement ps = c.prepareStatement("DELETE FROM observatorio_template_range WHERE id = ?")) {
			ps.setLong(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			Logger.putLog("SQL Exception: ", TemplateRangeDAO.class, Logger.LOG_LEVEL_ERROR, e);
			throw e;
		}
	}

	/**
	 * Exists etiqueta.
	 *
	 * @param c    the c
	 * @param form the form
	 * @return true, if successful
	 * @throws SQLException the SQL exception
	 */
	public static boolean exists(Connection c, final TemplateRangeForm form) throws SQLException {
		boolean exists = false;
		String query = "SELECT * FROM observatorio_template_range WHERE UPPER(name) = UPPER(?)";
		if (form.getId() != null) {
			query += " AND id <> ?";
		}
		try (PreparedStatement ps = c.prepareStatement(query)) {
			ps.setString(1, form.getName());
			if (form.getId() != null) {
				ps.setLong(2, form.getId());
			}
			ResultSet result = ps.executeQuery();
			if (result.next()) {
				exists = true;
			}
		} catch (SQLException e) {
			Logger.putLog("SQL Exception: ", EtiquetaDAO.class, Logger.LOG_LEVEL_ERROR, e);
			throw e;
		}
		return exists;
	}
}