
<ul>
@foreach($users as $user)

        <li> User name is={{ $user['name'] }} and city is = {{ $user['city'] }}</li>




@endforeach()
</ul>
