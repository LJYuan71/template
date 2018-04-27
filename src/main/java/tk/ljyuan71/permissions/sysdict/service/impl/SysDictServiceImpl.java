package tk.ljyuan71.permissions.sysdict.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import tk.ljyuan71.permissions.sysdict.dao.SysDictDao;
import tk.ljyuan71.permissions.sysdict.model.SysDict;
import tk.ljyuan71.permissions.sysdict.service.SysDictService;
import tk.ljyuan71.utils.Pager;
import tk.ljyuan71.utils.QueryFilter;

import com.github.pagehelper.PageHelper;
@Service
public class SysDictServiceImpl implements SysDictService{
	@Resource
	private SysDictDao sysDictDao;
	/**
	 * 添加
	 */
	@Override
	public boolean add(SysDict obj) {
		return sysDictDao.add(obj);
	}
	/**
	 * 修改
	 */	
	@Override
	public boolean update(SysDict obj) {
		return sysDictDao.update(obj);
	}
	/**
	 * 根据id获取
	 */
	@Override
	public SysDict getById(String id) {
		return (SysDict) sysDictDao.getById(id);
	}
	/**
	 * 根据id删除
	 */	
	@Override
	public boolean delById(String id) {
		return sysDictDao.delById(id);
	}
	/**
	 * 查询列表
	 * needPage 是否分页
	 * orderField	排序		id asc
	 */
	public Pager<SysDict> queryAll(QueryFilter queryFilter) {
		Map<String, Object> paramMap = queryFilter.getFilters();
		Pager<SysDict> rePager=new Pager<SysDict>();
		if (queryFilter.isNeedPage()) {
			//分页
			Pager<SysDict> pager = queryFilter.getPager();
			//分页插件
			PageHelper.offsetPage(pager.getBeginRum(), pager.getLimit());
			List<SysDict> list = sysDictDao.queryAll(paramMap);
			Integer total = sysDictDao.queryTotal(paramMap);
			rePager.setDataList(list);
			rePager.setCount(total);
		} else {
			//不分页
			List<SysDict> list = sysDictDao.queryAll(paramMap);
			rePager.setDataList(list);
		}
		return rePager;
	}
	
	/**
	 * 新增或者修改记录
	 */
	public Map<String, Object> insert(SysDict obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isSave = false;
		boolean flag = false;
		map.put("code", 500);
		if(obj != null){
			if(StringUtils.isBlank(obj.getDictGuid())){//新增
				isSave = true;
				obj.setDictGuid(UUID.randomUUID().toString());
				//obj.setCreateTime(System.currentTimeMillis());
				//obj.setCreatorName(currentUser.getUserName());
				//obj.setCreatorGuid(currentUser.getUserGuid());
				//obj.setIsDeleted(false);
			}else{//修改
				//obj.setModifyTime(System.currentTimeMillis());
				//obj.setModifyerName(currentUser.getUserName());
			}
			if(isSave){
				this.add(obj);
			}else{
				this.update(obj);
			}
			map.put("message", "保存成功");
			map.put("code", 200);
			flag = true;
		}else{
			map.put("message", "表单提交失败");
		}
		return map;
	}
	
	@Override
	public Map<String, Object> actions(String guid, String actionName) {
		Map<String, Object> map = new HashMap<String, Object>();
		SysDict bean = null;
		map.put("code", 500);
		boolean flag = false;
		if(StringUtils.isNotBlank(guid)){
			bean = this.getById(guid);
			if(bean != null){//判断操作名称
				if(StringUtils.isNotBlank(actionName)){
					//bean.setModifyTime(System.currentTimeMillis());
					//bean.setModifyerName(user.getUserName());
					if("sc".equals(actionName)){//删除
						//
						//bean.setIsDeleted(true);
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
			map.put("code", 200);
		}
		return map;
	}
	
	@Override
	public List<SysDict> queryAllSimple(Map<String, Object> filter) {
		if( filter.get("checked") != null){
			String checked = filter.get("checked").toString();
			checked = checked.replaceAll("，", ",");
			String[] checkeds = checked.split(",");
			if (checkeds.length > 1) {
				filter.put("keys", checkeds);
			} else {
				filter.put("keyEquals", checkeds[0]);
			}
			filter.remove("checked");
		}
		//不分页
		List<SysDict> list = sysDictDao.queryAllSimple(filter);
		if(list == null){
			list = new ArrayList<SysDict>();
		}
		return list;
	}
}