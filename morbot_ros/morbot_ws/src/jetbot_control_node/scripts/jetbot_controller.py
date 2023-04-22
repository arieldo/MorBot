#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist
from jetbot import Robot

print("start")
class JetBotController:
    def __init__(self):
        rospy.init_node('jetbot_controller', anonymous=True)

        self.robot = Robot()

        rospy.Subscriber('/cmd_vel', Twist, self.cmd_vel_callback)
        rospy.spin()

    def cmd_vel_callback(self, msg):
        linear_x = msg.linear.x
        angular_z = msg.angular.z

        left_motor_speed = linear_x - angular_z
        right_motor_speed = linear_x + angular_z

        # Set motor speeds
        self.robot.set_motors(left_motor_speed, right_motor_speed)

if __name__ == '__main__':
    try:
        jetbot_controller = JetBotController()
    except rospy.ROSInterruptException:
        pass
