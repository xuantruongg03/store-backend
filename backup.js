const cron = require('node-cron');
const { exec } = require('child_process');

// Thời gian backup database hàng ngày vào 1h sáng
const backupSchedule = '59 * * * *';

cron.schedule(backupSchedule, () => {
  console.log('Starting database backup...');
  // Thực hiện lệnh backup database ở đây
  exec('mysqldump -u root -p lexuantruong2k3@ --databases computer_store > backup.sql', (error, stdout, stderr) => {
    if (error) {
      console.error(`Backup process encountered an error: ${error.message}`);
    } else {
      console.log('Database backup completed successfully.');
    }
  });
});
