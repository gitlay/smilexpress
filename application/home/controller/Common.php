<?php
namespace app\home\controller;
use think\Db;
use clt\Leftnav;
use think\Controller;
class Common extends Controller{

    protected $pagesize,$changyan;
    public function initialize(){
        $sys = cache('System');
        $this->assign('sys',$sys);
        if($sys['mobile']=='open'){
            if(isMobile()){
                $this->redirect('mobile/index/index');
            }
        }
        //获取控制方法
        $action = request()->action();
        $controller = request()->controller();
        $this->assign('action',($action));
        $this->assign('controller',strtolower($controller));
        define('MODULE_NAME',strtolower($controller));
        define('ACTION_NAME',strtolower($action));
        //导航
        $thisCat = Db::name('category')->where('id',input('catId'))->find();

        if(input('catId')){
            $parentid = Db::name('category')->where('id',input('catId'))->order('sort')->value('parentid');
            if ($parentid){
                $child = Db::name('category')->where('parentid',$parentid)->order('sort')->select();
                $this->assign('child',$child);

                $parent = Db::name('category')->where('id',$parentid)->find();
                $this->assign('parent',$parent);
                $this->assign('parentName',$parent['catname']);
            }else{

                $child = Db::name('category')->where('parentid',input('catId'))->order('sort')->select();

                $url = url('home/'.MODULE_NAME.'/index',array('catId'=>$child[0]['id']));

                $this-> redirect($url);exit;
            }

        }

        $this->assign('catname',$thisCat['catname']);
        $this->assign('title',$thisCat['title']);
        $this->assign('keywords',$thisCat['keywords']);
        $this->assign('description',$thisCat['description']);
        define('DBNAME',strtolower($thisCat['module']));
        $this->pagesize = $thisCat['pagesize']>0 ? $thisCat['pagesize'] : '';
        $this->assign('image',$thisCat['image']);
        // 获取缓存数据
        $cate = cache('cate');

        if(!$cate){
            $column_one = Db::name('category')->where([['parentid','=',0],['ismenu','=',1]])->order('sort')->select();
            $column_two = Db::name('category')->where('ismenu',1)->order('sort')->select();
            $tree = new Leftnav ();
            $cate = $tree->index_top($column_one,$column_two);
            cache('cate', $cate, 3600);
        }
        // dump($cate);
        $this->assign('category',$cate);

        //广告
        $adList = cache('adList');
        if(!$adList){
            $adList = Db::name('ad')->where(['type_id'=>1,'open'=>1])->order('sort asc')->limit('8')->select();
            cache('adList', $adList, 3600);
        }
        $this->assign('adList', $adList);

        $bannerList = cache('bannerList');
        if(!$bannerList){
            $bannerList = Db::name('ad')->where(['type_id'=>5,'open'=>1])->order('sort asc')->limit('8')->select();
            cache('bannerList', $bannerList, 3600);
        }
        $this->assign('adList', $adList);
        $this->assign('bannerList', $bannerList);
        //友情链接
        $linkList = cache('linkList');
        if(!$linkList){
            $linkList = Db::name('link')->where('open',1)->order('sort asc')->select();
            cache('linkList', $linkList, 3600);
        }
        $this->assign('linkList', $linkList);
        //畅言
        $plugin = db('plugin')->where(['code'=>'changyan'])->find();
        $this->changyan = unserialize($plugin['config_value']);
        $this->assign('changyan', $this->changyan);
        $this->assign('time', time());

        //工作分类
        $job =  Db::name('category')->where([['parentid','=',51],['ismenu','=',1]])->order('sort')->select();
        foreach($job as $k=>$v){
            $job[$k]['info'] = Db::name('page')->where(['id'=>$v['id']])->find();
        }
        $this->assign('job', $job);

        $about = $this->getChildCategory(2);
        $this->assign('about',$about);

        $help = $this->getChildCategory(40);
        $this->assign('help',$help);
    }

    public function getChildCategory($parent_id,$with_content=0){
        $child = Db::name('category')->where('parentid',$parent_id)->order('sort')->select();
        if ($with_content==0){
            return  $child;
        }
        $model = db('article');
        foreach ($child as $k=>$v){
            // echo $v['id'];
            $child[$k]['content'] = $this->getContent($v['id'],$model);
        }

        return  $child;
    }

    public function getContent($cat_id,$model){
        $arrchildid = db('category')->where(['id'=>$cat_id])->value('arrchildid');
        $map = ' ';
        if($arrchildid!=$cat_id){
            $map .= 'catid in ($arrchildid)';
        }else{
            $map .= 'catid = '.$cat_id;
        }
        $map .= ' and (status = 1 or (status = 0 and createtime <'.time().'))';

        return $list = $model->where($map)->order('sort asc,createtime desc')->limit(7)->select();
    }
    public function _empty(){
        return $this->error('空操作，返回上次访问页面中...');
    }
}