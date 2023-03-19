# Installing ROS Melodic on Ubuntu 18.04

This guide will walk you through the installation process of ROS Melodic on Ubuntu 18.04. ROS (Robot Operating System) is a popular framework for building robotic software, providing tools and libraries for developing, simulating, and deploying robotic applications.

## Prerequisites

Before installing ROS Melodic, make sure you have the following prerequisites:

- Ubuntu 18.04 (Bionic Beaver) installed and updated with the latest packages.
- A working internet connection to download and install ROS packages.

## Installation Steps

Follow these steps to install ROS Melodic on Ubuntu 18.04:

1. Configure your Ubuntu system to accept software from packages.ros.org. First, add the ROS repository to your system's list of package sources:

    ```
    $ sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros-latest.list'
    ```

2. Next, add the ROS public key to your system:

    ```
    $ curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
    ```

3. Update your system's package index and install the ROS desktop-full package:

    ```
    $ sudo apt-get update
    $ sudo apt-get install ros-melodic-desktop-full
    ```

4. Initialize rosdep, a tool for installing system dependencies required by ROS packages:

    ```
    $ sudo rosdep init
    $ rosdep update
    ```

5. Set up your environment variables to use ROS. Add the following lines to your .bashrc file:

    ```
    $ echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
    $ source ~/.bashrc
    ```

6. Verify that ROS has been installed correctly by running the following command:

    ```
    $ roscore
    ```

    This should start the ROS master and display a message indicating that it is running.


## Now we need to Create a ROS Workspace for MorBot , so we can start developing and running ROS applications on our system.
# what is ROS Workspace you ask? good question ! 

## ROS Workspace

Imagine you have a big box of LEGO bricks, and you want to build something amazing. To keep everything organized, you would create separate sections in your box for different types of LEGO bricks. When you start building, you can easily find the pieces you need because they are all in the right place.

A catkin workspace is similar to that big box of LEGO bricks. It's a special place where you keep all the pieces (called packages) you need to build and run robots using ROS (Robot Operating System). Each package in the workspace is like a LEGO brick that does a specific job, and you can combine these packages to create a complete robot.

The catkin workspace has three main sections:

1. src: This is where you store all your packages (LEGO bricks). You can add new packages or modify existing ones here.

2. build: This is where the magic happens! When you want to build your robot, the catkin workspace will take the packages from the src folder and create a version that your computer can understand.

3. devel: This is where the built packages go. After building your robot, you can use the packages in this folder to run your robot or simulate it on your computer.
So, a catkin workspace is like a big, organized box that helps you build and run robots using ROS, just like you can create cool things with LEGO bricks when they are neatly organized in a box.

## Let's get started ! 

# Create a ROS Melodic Workspace

In this guide, we will create a ROS (Robot Operating System) Melodic workspace. This is an essential step for developing ROS packages and running simulations. Follow the step-by-step instructions below to get started.

## Step 1: Create a Workspace Directory

First, we will create a new directory to store our ROS packages. This directory is called a "workspace" in ROS terminology. Open a terminal and run the following commands:

```bash
$ mkdir -p ~/catkin_ws/src
$ cd ~/morbot_ws/
$ catkin_make
```

This will create a new directory called `morbot_ws` in your home directory. 
The `catkin_make` command will build the workspace and create a `devel` and `build` directory inside the workspace.

## Step 2: Source the Workspace

Next, we will add the workspace to the ROS environment. This will allow us to run ROS commands from any directory. To do this, we will add the following line to our 
`.bashrc` file:

```bash
$ echo "source ~/MorBot/morbot_ws/devel/setup.bash" >> ~/.bashrc
$ source ~/.bashrc
``` 

## Step 3: Verify Your Workspace

To verify that your workspace has been created correctly, run the following command:

```bash
$ echo $ROS_PACKAGE_PATH
```

You should see the following output:

```bash
/home/your_username/MorBot/morbot_ws/src:/opt/ros/noetic/share

```

Congratulations, you have successfully installed ROS Melodic on Ubuntu 18.04! You can now start developing and running ROS applications on your system.

For more information and tutorials on using ROS, check out the [ROS Wiki](http://wiki.ros.org/) and [ROS Tutorials](http://wiki.ros.org/ROS/Tutorials).

