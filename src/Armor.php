<?php

namespace Matters;

class Armor
{
    private $defense;

    public function __construct($defense)
    {
        $this->defense = $defense;
    }

    public function getDefense()
    {
        return $this->defense;
    }
}
