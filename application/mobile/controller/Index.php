<?php
namespace app\mobile\controller;
use clt\Lunar;
use think\Db;
use think\facade\Env;
use think\Request;

class Index extends Common{
    public function initialize(){
        parent::initialize();
    }
    public function index(){
        $express = $this->getChildCategory(32);
        $this->assign('express', $express);
        $increment = $this->getChildCategory(37);
        $this->assign('increment', $increment);

        $news = $this->getChildCategory(1,1);
        $this->assign('news', $news);


        return view();
    }
    public function down($id=''){
        $map['id'] = $id;
        $files = Db::name('download')->where($map)->find();
        return download(Env::get('root_path').'public'.$files['files'], $files['title']);
    }

    public function search(Request $request){
        if ($request->isGet()){
            $template = 'search';
            return $this->fetch($template);
        }
        $keyword = input('keyword','');
        $list=db('article')->alias('a')
            ->join(config('database.prefix').'category c','a.catid = c.id','left')
            ->where('a.title','like','%'.$keyword.'%')
            ->field('a.*,c.catdir,c.catname')
            ->order('a.sort','asc')
            ->paginate($this->pagesize);
        $page = $list->render();
        $list = $list->toArray();
        $this->assign('list',$list['data']);
        $this->assign('page',$page);

        $template = 'search_result';
        return $this->fetch($template);



    }
}