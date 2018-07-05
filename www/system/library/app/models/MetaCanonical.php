<?php

namespace app\models;

use Controller;
use app\core\App;


class MetaCanonical 
{
    /**
     * @var Controller
     */
	protected $controller;
	public $route;

	public function __construct(Controller $controller, $route)
	{
        $this->controller = $controller;
    	$this->route = $route;
	}  

    public function setCanonicalPageJustCanonical($curPage, $totalPages, $limitOnPage) 
    {
        App::$debug->dDie($curPage);
        $this->controller->document->addLink($this->controller->url->link($this->route, '', true), 'canonical');
    }

    public function setCanonicalPageWithPrevNext($curPage, $totalPages, $limitOnPage) 
    {
        $url = '';
       
        if ($curPage == 1) {
            $this->controller->document->addLink($this->controller->url->link($this->route, '', true), 'canonical');
        } elseif ($curPage == 2) {
            $this->controller->document->addLink($this->controller->url->link($this->route, '', true), 'prev');
        } else {
            $this->controller->document->addLink($this->controller->url->link($this->route, $url . '&page='. ($curPage - 1), true), 'prev');
        }

        if ($limitOnPage && ceil($totalPages / $limitOnPage) > $curPage) {
            $this->controller->document->addLink($this->controller->url->link($this->route, $url . '&page='. ($curPage + 1), true), 'next');
        }
    }
    

}