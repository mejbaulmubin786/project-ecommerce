
@switch($result)
@case(100)
    <h1>Result is hundred</h1>
    @break
@case(1000)
    <h1>Result is thousend</h1>
    @break
@case(100000)
    <h1>Result is lakh</h1>
    @break
@default
    <h1>Result is not in our range</h1>

@endswitch



