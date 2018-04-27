package tk.ljyuan71.permissions.zbdl.service.impl;
import tk.ljyuan71.permissions.zbdl.model.ZBGcZbdl;
import tk.ljyuan71.permissions.zbdl.dao.ZBGcZbdlDao;
import tk.ljyuan71.permissions.zbdl.service.ZBGcZbdlService;

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
public class ZBGcZbdlServiceImpl implements ZBGcZbdlService{
	@Resource
	private ZBGcZbdlDao zBGcZbdlDao;
	/**
	 * 添加
	 */
	@Override
	public boolean add(ZBGcZbdl obj) {
		return zBGcZbdlDao.add(obj);
	}
	/**
	 * 修改
	 */	
	@Override
	public boolean update(ZBGcZbdl obj) {
		return zBGcZbdlDao.update(obj);
	}
	/**
	 * 根据id获取
	 */
	@Override
	public ZBGcZbdl getById(String id) {
		return (ZBGcZbdl) zBGcZbdlDao.getById(id);
	}
	/**
	 * 根据id删除
	 */	
	@Override
	public boolean delById(String id) {
		return zBGcZbdlDao.delById(id);
	}
	/**
	 * 查询列表
	 * needPage 是否分页
	 * orderField	排序		id asc
	 */
	public Pager<ZBGcZbdl> queryAll(QueryFilter queryFilter) {
		Map<String, Object> paramMap = queryFilter.getFilters();
		Pager<ZBGcZbdl> rePager=new Pager<ZBGcZbdl>();
		if (queryFilter.isNeedPage()) {
			//分页
			Pager<ZBGcZbdl> pager = queryFilter.getPager();
			//分页插件
			PageHelper.offsetPage(pager.getBeginRum(), pager.getLimit());
			List<ZBGcZbdl> list = zBGcZbdlDao.queryAll(paramMap);
			Integer total = zBGcZbdlDao.queryTotal(paramMap);
			rePager.setDataList(list);
			rePager.setCount(total);
		} else {
			//不分页
			List<ZBGcZbdl> list = zBGcZbdlDao.queryAll(paramMap);
			rePager.setDataList(list);
		}
		return rePager;
	}
	
	/**
	 * 新增或者修改记录
	 */
	public Map<String, Object> insert(ZBGcZbdl obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isSave = false;
		boolean flag = false;
		if(obj != null){
			if(StringUtils.isBlank(obj.getGcZbdlGuid())){//新增
				isSave = true;
				obj.setGcZbdlGuid(UUID.randomUUID().toString());
				//obj.setCreateTime(System.currentTimeMillis());
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
		ZBGcZbdl bean = null;
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