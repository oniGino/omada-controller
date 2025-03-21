Omada Controller v5.15.20.16 for Linux (X64)

For how to install Omada Controller on the Linux operation system, please refer to the faq: https://www.omadanetworks.com/us/support/faq/3272/
If you are using the old controller and planning to upgrade to this version, please follow the Omada Controller Upgrade Guide.
Upgrade Guide: https://www.omadanetworks.com/en/omada-sdn/controller-upgrade

Notes:
1. This version of Omada Controller supports Java 17 and MongoDB 3.0-8.0 And there are no built-in JRE and MongoDB, so you need to install them by yourself.
2. You need to install jsvc and curl first before you install Omada Controller.
3. If you want Omada Controller to run as a non-root user (it runs as root by default), please refer to https://www.omadanetworks.com/support/faq/3583/
4. Supporting 64-bit Linux operating system, including Ubuntu 16.04/18.04/20.04/22.04 and Debian 8/9/10.

Installation Steps:
1. Install Java 17
2. Install MongoDB 3.0-8.0
3. Install jsvc
4. Install curl
5. Install Omada SDN Controller
5. Start the Omada Controller service using the command: tpeap start.  Launch a web browser and visit http://localhost:8088 or https://localhost:8043 to enter the management interface of Omada Controller.
You can also use the following commands to stop the service or view the service status:
   To stop the service: tpeap stop
   To view the service status: tpeap status
6. Follow the quick setup wizard to complete the basic settings.
   For more instructions, please refer to the User Guide of Omada Controller.

Tips:
1. To uninstall Omada Controller, run the command: sudo bash /opt/tplink/EAPController/uninstall.sh
2. If the Omada Controller cannot detect EAP devices, it is possibly because the firewall intercepts the service.
Please make sure that the ports 8088, 8043, 27001, 27002, 29810, 29811, 29812, 29813 and 29814 are available.