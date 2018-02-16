<?php

namespace Matters;

use \PHPUnit\Framework\TestCase;

class CharacterTest extends TestCase
{
    public function testAttack() {
        $hero = new Character(30, 5);
        $vilain = new Character(25, 8);

        $theBiggestSwordOfAllTime = new Weapon(50);
        $hero->equip($theBiggestSwordOfAllTime);

        $simpleHoodie = new Armor(1);
        $vilain->putsOn($simpleHoodie);

        $hero->attack($vilain);
        self::assertFalse($vilain->isAlive());
    }
}
