#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist
from jetbot import Robot

print("Start jetbot controller")
class JetBotController:
    def __init__(self):
        # Initialize the ROS node
        rospy.init_node('jetbot_controller', anonymous=True)

        # Create a Robot object
        self.robot = Robot()

        # Subscribe to the '/cmd_vel' topic and define the callback function
        rospy.Subscriber('/cmd_vel', Twist, self.cmd_vel_callback)
        rospy.spin()

    # Callback function for the '/cmd_vel' topic
    def cmd_vel_callback(self, msg):
        # Extract linear and angular velocity from the message
        linear_x = msg.linear.x
        angular_z = msg.angular.z

        # Calculate motor speeds based on linear and angular velocities
        left_motor_speed = linear_x - angular_z
        right_motor_speed = linear_x + angular_z

        # Set motor speeds
        self.robot.set_motors(left_motor_speed, right_motor_speed)

if __name__ == '__main__':
    try:
        # Create a JetBotController object
        jetbot_controller = JetBotController()
    except rospy.ROSInterruptException:
        # Handle the ROSInterruptException gracefully
        pass
