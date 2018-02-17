<?php

namespace Matters;

class Character
{
    private $life;
    private $force;
    private $armor;
    private $weapon;

    public function __construct($life, $force)
    {
        $this->life = $life;
        $this->force = $force;
        $this->weapon = new Weapon(0);
        $this->armor = new Armor(0);
    }

    public function attack(Character $opponent)
    {
        $opponent->receiveDamages($this->weapon->getDamages() + $this->force);
    }

    public function receiveDamages($damages)
    {
        $this->life -= $damages - ($this->armor->getDefense() + $this->force);
    }

    public function equip(Weapon $weapon)
    {
        $this->weapon = $weapon;
    }

    public function putsOn(Armor $armor)
    {
        $this->armor = $armor;
    }

    public function isAlive()
    {
        return $this->life > 0;
    }
};
