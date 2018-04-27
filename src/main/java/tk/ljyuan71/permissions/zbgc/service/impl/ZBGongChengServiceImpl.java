package tk.ljyuan71.permissions.zbgc.service.impl;
import tk.ljyuan71.permissions.zbgc.model.ZBGongCheng;
import tk.ljyuan71.permissions.zbgc.dao.ZBGongChengDao;
import tk.ljyuan71.permissions.zbgc.service.ZBGongChengService;

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
public class ZBGongChengServiceImpl implements ZBGongChengService{
	@Resource
	private ZBGongChengDao zBGongChengDao;
	/**
	 * 添加
	 */
	@Override
	public boolean add(ZBGongCheng obj) {
		return zBGongChengDao.add(obj);
	}
	/**
	 * 修改
	 */	
	@Override
	public boolean update(ZBGongCheng obj) {
		return zBGongChengDao.update(obj);
	}
	/**
	 * 根据id获取
	 */
	@Override
	public ZBGongCheng getById(String id) {
		return (ZBGongCheng) zBGongChengDao.getById(id);
	}
	/**
	 * 根据id删除
	 */	
	@Override
	public boolean delById(String id) {
		return zBGongChengDao.delById(id);
	}
	/**
	 * 查询列表
	 * needPage 是否分页
	 * orderField	排序		id asc
	 */
	public Pager<ZBGongCheng> queryAll(QueryFilter queryFilter) {
		Map<String, Object> paramMap = queryFilter.getFilters();
		Pager<ZBGongCheng> rePager=new Pager<ZBGongCheng>();
		if (queryFilter.isNeedPage()) {
			//分页
			Pager<ZBGongCheng> pager = queryFilter.getPager();
			//分页插件
			PageHelper.offsetPage(pager.getBeginRum(), pager.getLimit());
			List<ZBGongCheng> list = zBGongChengDao.queryAll(paramMap);
			Integer total = zBGongChengDao.queryTotal(paramMap);
			rePager.setDataList(list);
			rePager.setCount(total);
		} else {
			//不分页
			List<ZBGongCheng> list = zBGongChengDao.queryAll(paramMap);
			rePager.setDataList(list);
		}
		return rePager;
	}
	
	/**
	 * 新增或者修改记录
	 */
	public Map<String, Object> insert(ZBGongCheng obj) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean isSave = false;
		boolean flag = false;
		if(obj != null){
			if(StringUtils.isBlank(obj.getGcGuid())){//新增
				isSave = true;
				obj.setGcGuid(UUID.randomUUID().toString());
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
		ZBGongCheng bean = null;
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