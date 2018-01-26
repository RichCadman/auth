<?php
/**
 * Created by PhpStorm.
 * User: jinan
 * Date: 2018/1/9
 * Time: 9:58
 */

namespace Admin\Controller;

use Think\Controller;

class UserController extends BaseController
{
    //显示用户页面
    public function user_index()
    {
        $Auth = new \Think\Auth;
        $uid = $_SESSION['userinfo']['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $info = M('admin')->select();
            $this->assign(array(
                'display' => 'User',
                'current' => 'user_index',
                'info' => $info,
            ));
            $this->display();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }
    }

    //添加用户页面
    public function add_user()
    {
        $Auth = new \Think\Auth;
        $uid = $_SESSION['userinfo']['id'];
        $res = $Auth->check(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME, $uid);
        if ($res) {
            $this->assign(array(
                'display' => 'User',
                'current' => 'add_user',
            ));
            $this->display();
        } else {
            echo "<script>alert('权限不足！');window.history.back();</script>";
        }

    }

    //添加用户
    public function add_user_do()
    {
        if ($_POST['username'] && $_POST['password']) {
            $_POST['password'] = md5($_POST['password']);
            $res = M('admin')->add($_POST);
            if ($res) {
                echo "<script>alert('添加成功！');window.location='/admin.php/User/user_index'</script>";
            }
        } else {
            echo "<script>alert('填写完整！');window.history.back();</script>";
        }
    }
}