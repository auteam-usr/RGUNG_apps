#!/bin/bash
echo packettracer fixing!! > /home/user/packet.txt
sudo ip netns add packettracer
sudo ip netns exec packettracer /opt/pt/packettracer --no-sandbox %f
echo PT fixed > /home/user/packet_fixed.txt

