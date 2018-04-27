package tk.ljyuan71.permissions.zbxiangmu.service.impl;
import tk.ljyuan71.permissions.zbxiangmu.model.ZBXiangMu;
import tk.ljyuan71.permissions.zbxiangmu.dao.ZBXiangMuDao;
import tk.ljyuan71.permissions.zbxiangmu.service.ZBXiangMuService;

import java.util.Map;
import java.util.List;
import java.util.HashMap;
import java.util.UUID;
import org.apache.commons.lang3.StringUtils;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import tk.ljyuan71.utils.Pager;
import tk.ljyuan71.utils.QueryFilter;

@Service
public class ZBXiangMuServiceImpl implements ZBXiangMuService{
	@Resource
	private ZBXiangMuDao zBXiangMuDao;
	/**
	 * 添加
	 */
	@Override
	public boolean add(ZBXiangMu obj) {
		return zBXiangMuDao.add(obj);
	}
	/**
	 * 修改
	 */	
	@Override
	public boolean update(ZBXiangMu obj) {
		return zBXiangMuDao.update(obj);
	}
	/**
	 * 根据id获取
	 */
	@Override
	public ZBXiangMu getById(String id) {
		return (ZBXiangMu) zBXiangMuDao.getById(id);
	}
	/**
	 * 根据id删除
	 */	
	@Override
	public boolean delById(String id) {
		return zBXiangMuDao.delById(id);
	}
	/**
	 * 查询列表
	 * needPage 是否分页
	 * orderField	排序		id asc
	 */
	public Pager<ZBXiangMu> queryAll(QueryFilter queryFilter) {
		Map<String, Object> paramMap = queryFilter.getFilters();
		Pager<ZBXiangMu> rePager=new Pager<ZBXiangMu>();
		if (queryFilter.isNeedPage()) {
			//分页
			Pager<ZBXiangMu> pager = queryFilter.getPager();
			//分页插件
			PageHelper.offsetPage(pager.getBeginRum(), pager.getLimit());
			List<ZBXiangMu> list = zBXiangMuDao.queryAll(paramMap);
			Integer total = zBXiangMuDao.queryTotal(paramMap);
			rePager.setDataList(list);
			rePager.setCount(total);
		} else {
			//不分页
			List<ZBXiangMu> list = zBXiangMuDao.queryAll(paramMap);
			rePager.setDataList(list);
		}
		return rePager;
	}
	
	/**
	 * 新增或者修改记录
	 */
	public Map<String, Object> insert(ZBXiangMu obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isSave = false;
		boolean flag = false;
		if(obj != null){
			if(StringUtils.isBlank(obj.getXmGuid())){//新增
				isSave = true;
				obj.setXmGuid(UUID.randomUUID().toString());
				obj.setCreateTime(System.currentTimeMillis());
				//obj.setCreatorName(currentUser.getUserName());
				//obj.setCreatorGuid(currentUser.getUserGuid());
				obj.setIsDeleted(false);
			}else{//修改
				obj.setModifyTime(System.currentTimeMillis());
				//obj.setModifyerName(currentUser.getUserName());
			}
			if(isSave){
				this.add(obj);
			}else{
				this.update(obj);
			}
			map.put("message", "保存成功");
			flag = true;
		}else{
			map.put("code", "500");
			map.put("message", "表单提交失败");
		}
		return map;
	}
	
	@Override
	public Map<String, Object> actions(String guid, String actionName) {
		Map<String, Object> map = new HashMap<String, Object>();
		ZBXiangMu bean = null;
		map.put("code", "500");
		boolean flag = false;
		if(StringUtils.isNotBlank(guid)){
			bean = this.getById(guid);
			if(bean != null){//判断操作名称
				if(StringUtils.isNotBlank(actionName)){
					//bean.setModifyTime(System.currentTimeMillis());
					//bean.setModifyerName(user.getUserName());
					if("sc".equals(actionName)){//删除
						//
						bean.setIsDeleted(true);
						this.update(bean);
						map.put("message", "删除成功");
						flag = true;
					}else if("sx".equals(actionName)){//失效
						//
						flag = true;
					}else{
						map.put("message", "不支持该项操作");
					}
				}else{
						map.put("message", "获取不到操作类型");
				}
			}else{
				map.put("message", "获取不到对象信息，无法操作");
			}
		}else{
			map.put("message", "获取不到id信息，无法操作");
		}
		if (flag) {
			map.put("code", "200");
		}
		return map;
	}
}