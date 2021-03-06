[if condition="loggedin"]
<p>Welcome, [var]username[/var]!</p>
[/if]
[if condition="loggedin" not="true"]
<p>Please log in.</p>
[/if]
<fieldset>
    <legend>Who's Online?</legend>
    <p>
        [loop value="value" iterable="members" join=","]
        [if condition="value.admin"]<strong>[/if]
        [if condition="value.banned"]<del>[/if]
        [var]value.name[/var]
        [if condition="value.admin"]</strong>[/if]
        [if condition="value.banned"]</del>[/if]
        [/loop]
    </p>
</fieldset>