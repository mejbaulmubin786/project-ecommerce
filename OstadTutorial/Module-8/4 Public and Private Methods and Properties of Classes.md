
```php
<?php
class Fund {
    private $fund;
    function __construct($fund = 0) {
        $this->fund = $fund;
    }
    public function addFund($money) {
        $this->fund += $money;
    }

    public function deductFund($money) {
        $this->fund -= $money;
    }

    public function getTotal() {
        echo "Total fund is {$this->fund}\n";
    }
}

$ourFund = new Fund(100);
//$ourFund->fund = 75; it is not possible because fund is private
$ourFund->getTotal();
$ourFund->addFund(50);
$ourFund->getTotal();
$ourFund->deductFund(7);
$ourFund->getTotal();
```