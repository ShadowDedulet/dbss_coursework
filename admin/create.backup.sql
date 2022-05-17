use pc_upgrade;
go

backup database pc_upgrade
to disk = 'c:\tmp\pc_upgrade.bak'
   with 
      name = 'Full backup of pc_upgrade db';
go