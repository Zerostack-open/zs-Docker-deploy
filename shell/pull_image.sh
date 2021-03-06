#!/bin/sh

set -e
ZCOSURL='http://54.183.17.201/html/zsusb-platform-3.0.0-100766.iso'
echo ""
echo ""
echo "Welcome to the ZeroStack install container."
echo ""
echo ""
echo "From here you can pull the ZeroStack Cloud Operating System."
echo ""
echo "Step 1: Pull the ZCOS from ${ZCOSURL}. This is an RC build and should not be used in a production environment."
echo "To get the current GA release please contact ZeroStack sales at sales@zerostack.com"
echo ""
echo "Step 2: Once the ISO is pulled copy it to a USB stick with the follwoing procedure. This example is done on a Linux system, however"
echo "        the USB stick can be created with a Windows or Mac system."
echo ""
echo "        a. Open a terminal"
echo ""
echo "        b. # sudo fdisk -l"
echo "           NOTE: The Disk devices (/dev/sdX), and insert the USB drive."
echo ""
echo "        c. # sudo fdisk -l"
echo "           NOTE: Re-run fdisk, note the NEW disk device (eg /dev/sdc) for the USB device."
echo ""
echo "        d. # export DISK=/dev/sdc"
echo ""
echo "        e. # sudo umount $DISK"
echo "           Unmount the device - do NOT eject it. The disk can not be in use while the image is written."
echo ""
echo "        f. # sudo sh -c pv -bapr ZCOS_ISO.iso > $DISK"
echo "           Write the ISO file to the device using the 'PV' command."
echo ""
echo "        NOTE: It is important that you write to the CORRECT device, you can WIPE your system out if you use the wrong device."
echo ""
echo "        g. # sudo unmount $DISK"
echo ""
echo "Step 3: Insert the newly created USB install stick into the target server."
echo "        Make sure the server is capable of booting from USB, and that is set to boot from an SSD."
echo ""
echo "        NOTE: An operational Zerostack cluster is made up of 4 nodes."
echo "        NOTE: Make sure that the target server meets the requeirments in the Zerostack MVH specification."
echo "              https://zerostack.zendesk.com/hc/en-us/articles/115008840528-ZeroStack-Minimum-Viable-Hardware-MVH-Guidelines"
echo ""
echo "Step 4: Once the server boots the ZCOS USB image. Use the zsbootstrap installer to set up the node."
echo ""
echo "        a. Login to the install image username: zerostack password: live"
echo ""
echo "        b. # sudo su"
echo "           Re-enter the password"
echo ""
echo "        c. # cd /home/zerostack/zsbootstrap/data/ "
echo ""
echo "        d. # ./zsbootstrap --interactive "
echo ""
echo "        e. installer> configure"
echo ""
echo "        f. Once configure is run the following will need to be set."
echo "           Hostname: zhost01"
echo "           Zhost IP address and subnet: 192.168.10.10/24"
echo "           ZVM IP address and subnet: 192.168.10.11/24"
echo "           Defualt gateway: 192.168.10.1"
echo "           VLAN for mgmt traffic (blank or 0 for none): none"
echo "           Name server(s): 8.8.8.8"
echo "           NTP Servers(s) (Space seperated list, blank for default pool): "
echo "           Enable LACP true or false: false"
echo ""
echo "        g. Once the configuration is complete, run the installer."
echo "           installer> install"
echo ""
echo "        h. Once the installer is finished reboot the server."
echo ""
echo "Step 5: Once the nodes are installed and ready to go, ping all of the IP addresses used in the cluster to ensure they are live."
echo ""
echo "Step 6: Now that all of the ZCOS nodes are up and running, a new Cloud Create account will need to be created by the Zerostack support staff."
echo "        email support at: support@zerostack.com"
echo ""
echo "Step 7: Once a cloud create account has been created login to get the 6 character short code. The short code is what is used to connect"
echo "        your nodes to the SaaS platform and build your on-prem private cloud."
echo "        Cloud Create URL: https://console.zerostack.com/ui/zs.html#/login"
echo ""
echo "Step 8: To add the short code to the nodeuse the zcli."
echo "        Ex. # zcli account validate 67b74a"
echo ""
echo "Step 9: Once the short code is added to the node, it will appear in the cloud create interface. Once all of the nodes are added, walk through"
echo "        the configuration and start the cloud create process. Once the cloud create process is finshed the Zerostack private cloud will be operational."
echo "        If an error occures at any point in the process file a support case with Zeorstack support."
echo "        Support URL: https://zerostack.zendesk.com/hc/en-us"
echo ""
echo ""
echo "To learn more about Zerostack please check out our Resources page at https://www.zerostack.com/resources/"
echo ""
#echo ""
#read -p "Would you like to download the ZCOS image? (Y/N)" -n 1 -r
#if [[ ! $REPLY -ne ^[Yy]$ ]]; then
#    exit 1
#else
#    wget -P '/opt/ZCOS/' $ZCOSURL || { echo "Could not download ZCOS."; exit 1; }
#fi