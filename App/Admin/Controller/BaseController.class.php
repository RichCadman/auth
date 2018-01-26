<?php
namespace Admin\Controller;
use Think\Controller;
class BaseController extends Controller{
    /**
     *构造方法_initialize
     */
    public function _initialize(){
        if(!isset($_SESSION['userinfo'])){
            echo "<script type='text/javascript'>alert('你没有登录,没有权限访问');window.location=\"/admin.php/Login/login\";</script>";
        }
        //查询菜单列表
        $menu = M('rule')->where("is_visible = 1")->select();
        $this->assign('menu',$menu);
        //通过权限控制左侧菜单的显示与隐藏
        //用户id
        $uid = $_SESSION['userinfo']['id'];
        //通过用户id查询所属用户组
        $group_access_info = M('group_access')->where("uid = $uid")->find();
        //获取用户组id
        $group_id = $group_access_info['group_id'];
        //根据用户组id查询权限菜单menu_id组
        $group_info = M('group')->where("id = $group_id")->find();
        //权限菜单 id 组
        $menu_info = $group_info['menu_id'];
        //var_dump($rule_info);exit;//字符串格式
        //转为数组
        $menu_array=explode(",",$menu_info);
        $this->assign('menu_array',$menu_array);

        //二级操作菜单  id  组
        $rule_info = $group_info['rules'];
        //转为数组
        $rule_array = explode(",",$rule_info);
        $this->assign('rule_array',$rule_array);
    }
}