package tk.ljyuan71.gencode.db.helper.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import tk.ljyuan71.gencode.db.helper.MapCmd;
import tk.ljyuan71.gencode.db.model.TableModel;

/**
 * @author ljyuan 2018年3月20日
 * @Description:  
 */
public class MySqlMapTab implements MapCmd<TableModel> {
	
	@Override
	public TableModel getObjecFromRs(ResultSet rs) throws SQLException {
		TableModel model = new TableModel();
		String name = rs.getString("TABLE_NAME");
		String comments = rs.getString("TABLE_COMMENT");
		model.setTableName(name);
		model.setTabComment(comments);
		return model;
	}
}
