<?php
namespace app\mobile\controller;
use think\Db;
use clt\Leftnav;
use think\Controller;
class Common extends Controller
{
    public function initialize()
    {
        if(!isMobile()){
            $this->redirect('home/index/index');
        }
        $sys = cache('System');
        $this->assign('sys',$sys);

        //导航
        $cate = cache('cate');
        if(!$cate){
            $column_one = Db::name('category')->where([['parentid','=',0],['ismenu','=',1]])->order('sort')->select();
            $column_two = Db::name('category')->where('ismenu',1)->order('sort')->select();
            $tree = new Leftnav ();
            $cate = $tree->index_top($column_one,$column_two);
            cache('cate', $cate, 3600);
        }
        $this->assign('category',$cate);

        //二级导航
        $thisCat = Db::name('category')->where('id',input('catId'))->find();
        if(input('catId')){
            $parentid = Db::name('category')->where('id',input('catId'))->order('sort')->value('parentid');
            if ($parentid){
                $child = Db::name('category')->where('parentid',$parentid)->order('sort')->select();
                $this->assign('child',$child);

                $parent = Db::name('category')->where('id',$parentid)->find();
                $this->assign('parent',$parent);
                $this->assign('parentid',$parentid);
                $this->assign('parentName',$parent['catname']);
            }else{

                $child = Db::name('category')->where('parentid',input('catId'))->order('sort')->select();

                $this->assign('child',$child);
            }

        }
        $this->assign('catId',input('catId',0));
        $this->assign('title',$thisCat['title']);
        $this->assign('keywords',$thisCat['keywords']);
        $this->assign('description',$thisCat['description']);
        $this->assign('image',$thisCat['imagea']);
        define('DBNAME',strtolower($thisCat['module']));
        $this->pagesize = $thisCat['pagesize']>0 ? $thisCat['pagesize'] : '';

        //广告
        $adList = cache('adList');
        if(!$adList){
            $adList = Db::name('ad')->where(['type_id'=>10,'open'=>1])->order('sort asc')->limit('4')->select();
            cache('adList', $adList, 3600);
        }
        $this->assign('adList', $adList);

        //畅言
        $plugin = db('plugin')->where(['code'=>'changyan'])->find();
        $this->changyan = unserialize($plugin['config_value']);
        $this->assign('changyan', $this->changyan);
    }
    //空操作
    public function _empty(){
        return $this->error('空操作，返回上次访问页面中...');
    }
    public function getChildCategory($parent_id,$with_content=0){
        $child = Db::name('category')->where('parentid',$parent_id)->order('sort')->select();
        if ($with_content==0){
            return  $child;
        }

        foreach ($child as $k=>$v){
            // echo $v['id'];
            $child[$k]['content'] = $this->getContent($v['id'],db('article'));
        }

        return  $child;
    }

    public function getContent($cat_id,$model){


       $map = 'catid = '.$cat_id.' and (status = 1 or (status = 0 and createtime <'.time().'))';

         $list = $model->where($map)->order('sort asc,createtime desc')->limit(7)->select();
       // $model->getLastSql();
        return $list;
    }
}
