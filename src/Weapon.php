<?php

namespace Matters;

class Weapon
{
    private $damages;

    public function __construct($damages)
    {
        $this->damages = $damages;
    }

    public function getDamages()
    {
        return $this->damages;
    }
}
