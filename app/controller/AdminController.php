<?php

class AdminController
{

    private $presenter;

    public function __construct($presenter)
    {
        $this->presenter = $presenter;
    }

    public function inicio()
    {
        echo $this->presenter->render('admin');
    }


}