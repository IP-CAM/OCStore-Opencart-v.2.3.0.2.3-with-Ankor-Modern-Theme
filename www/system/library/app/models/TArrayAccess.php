<?php
/**
 * Created by PhpStorm.
 * User: korns
 * Date: 19.10.2017
 * Time: 12:08
 */

namespace app\models;


trait TArrayAccess {

    protected $_container;

    public function offsetExists($offset)
    {
        return isset($this->_container[$offset]);
    }

    public function offsetGet($offset)
    {
        return $this->offsetExists($offset) ? $this->_container[$offset] : null;
    }

    public function offsetSet($offset, $value)
    {
        if (is_null($offset)) {
            $this->_container[] = $value;
        } else {
            $this->_container[$offset] = $value;
        }
    }

    public function offsetUnset($offset)
    {
        unset($this->_container[$offset]);
    }



}