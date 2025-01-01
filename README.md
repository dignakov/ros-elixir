# Updates

## 1
* removed mixes.lock to update dependencies as far as they can be updated
* added pixi.toml to build ros messages
* updating .gitignore
* updated elixir version to 1.18

###
$mix deps.get

$mix hex.outdated:
Dependency   Current  Latest  Status               
bite         0.1.1    0.1.1   Up-to-date           
cowboy       2.12.0   2.12.0  Up-to-date           
credo        0.10.2   1.7.11  Update not possible  
dialyxir     0.5.1    1.4.5   Update not possible  
ex_doc       0.19.1   0.36.1  Update not possible  
excoveralls  0.18.3   0.18.3  Up-to-date           
mox          0.4.0    1.2.0   Update not possible  
private      0.1.2    0.1.2   Up-to-date           
satchel      0.1.1    0.1.1   Up-to-date           
xenium       0.1.0    0.1.0   Up-to-date 

need to check on:

credo        0.10.2   1.7.11  Update not possible  
dialyxir     0.5.1    1.4.5   Update not possible  
ex_doc       0.19.1   0.36.1  Update not possible  
mox          0.4.0    1.2.0   Update not possible  


# ROS - Elixir

> Caution: I don't really work no this repo any more as I don't have a robot
> running ROS these days. There are outstanding needs for
> solutions for interoperability with `rosrun` or `roslaunch`. Please use only
> for development purposes and curiosity only. Forks welcome :)

ROS Elixir is fully compatible with the regular way of making publishers,
subscribers, services, and service proxies. You can do so like so:

## Example Publisher

```elixir
use ROS

children = [
  node(:"/mynode", [
    publisher(:mypub, "chatter", "std_msgs/String")
  ])
]

Supervisor.start_link(children, strategy: :one_for_one)

for n <- 1..100 do
  Publisher.publish(:mypub, %StdMsgs.String{data: "This is my #{n}th message!"})
end
```

## Example Subscriber

```elixir
use ROS

callback = fn %StdMsgs.String{data: data} ->
  IO.puts(data)
end

children = [
  node(:"/mynode", [
    subscriber("chatter", "std_msgs/String", callback)
  ])
]

Supervisor.start_link(children, strategy: :one_for_one)
```

## Example Service

```elixir
use ROS

callback = fn %RospyTutorials.AddTwoInts.Request{a: a, b: b} ->
  %RospyTutorials.AddTwoInts.Response{sum: a + b}
end

children = [
  node(:"/mynode", [
    service("add_two_ints", "rospy_tutorials/AddTwoInts", callback)
  ])
]

Supervisor.start_link(children, strategy: :one_for_one)
```

## Example Service Proxy

```elixir
use ROS

children = [
  node(:"/mynode", [
    service_proxy(:myproxy, "add_two_ints", "rospy_tutorials/AddTwoInts")
  ]
]

Supervisor.start_link(children, strategy: :one_for_one)

ServiceProxy.request(:myproxy, %RospyTutorials.AddTwoInts.Request{a: 3, b: 4})
#=> {:ok, %RospyTutorials.AddTwoInts.Response{sum: 7}}
```

See the `example_ws` directory for an example app.
