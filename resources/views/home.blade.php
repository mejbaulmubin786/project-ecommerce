
@if($result==100)
    <h1>Result is hundred</h1>
@elseif ($result==1000)
    <h1>Result is thousend</h1>
@elseif ($result==100000)
    <h1>Result is lakh</h1>
@else
    <h1>Result is not in our range</h1>

@endif



