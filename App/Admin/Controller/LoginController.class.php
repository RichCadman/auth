<?php
namespace Admin\Controller;
use Think\Controller;
class LoginController extends Controller{
    //登录页面
    public function login(){
        unset($_SESSION['userinfo']);
        $this->display();
    }
    //登录
    public function login_do(){
        if($_POST['username'] && $_POST['password']){
            $username = $_POST['username'];
            $password = md5($_POST['password']);
            $res = M('admin')->where("username = '$username' and password = '$password'")->find();
            if($res){
                $_SESSION['userinfo'] = $res;
                echo "<script>alert('登录成功!');window.location='/admin.php/User/user_index';</script>";
            }else{
                echo "<script>alert('用户名或密码错误！');window.history.back();</script>";
            }
        }else{
            echo "<script>alert('请填写用户名或密码');window.history.back();</script>";
        }
    }
}