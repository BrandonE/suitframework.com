<?php
class Helpers
{
    public function currenttime()
    {
        return date('m/d/Y H:M:S');
    }
}

$templating->var->username = 'Brandon';
$templating->var->loggedin = true;
$templating->var->members = array
(
    array
    (
        'name' => 'Brandon',
        'admin' => true,
        'banned' => false
    ),
    array
    (
        'name' => 'Chris',
        'admin' => false,
        'banned' => true
    )
);
$templating->var->owner = 'Brandon';
$templating->var->ownerfull = 'Brandon Evans';
?>