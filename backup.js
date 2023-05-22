const { google } = require("googleapis");
const cron = require("node-cron");
const { exec } = require("child_process");
const fs = require("fs");
require("dotenv").config();

const nameDB = process.env.DATABASE_DB;
const userDB = process.env.USER_DB;
const passwordDB = process.env.PASSWORD_DB;
const hostDB = process.env.HOST_DB;
const apiKey = process.env.GOOGLE_API_KEY;
const backupSchedule = "*/1 * * * *";
const backupFilePath = "backup_db.sql";

const credentials = require("./credentials.json");
const tokenPath = "token.json";

const oauth2Client = new google.auth.OAuth2(
  credentials.web.client_id,
  credentials.web.client_secret,
  credentials.web.redirect_uris[0]
);

cron.schedule(backupSchedule, () => {
  console.log("Starting database backup...");
  exec(
    `mysqldump -h ${hostDB} -u ${userDB} -p"${passwordDB}" ${nameDB} > ${backupFilePath}`,
    (error, stdout, stderr) => {
      if (error) {
        console.error(`Backup process encountered an error: ${error.message}`);
      } else {
        console.log("Database backup completed successfully.");
        const drive = google.drive({ version: "v3", auth: oauth2Client });

        let date = new Date();
        const name = `backup_db_${date.getDate()}_${date.getMonth()}_${date.getFullYear()}_${date.getHours()}_${date.getMinutes()}_${date.getSeconds()}.sql`;
        const fileMetadata = {
          name: name,
          parents: ["1bm1c0dJA0MKgIJi1Ryylvoe0zBdWMsYq"],
        };

        const media = {
          mimeType: "application/sql",
          body: fs.createReadStream(backupFilePath),
        };

        drive.files.create(
          {
            resource: fileMetadata,
            media: media,
            fields: "id",
          },
          (err, file) => {
            if (err) {
              console.error("Error uploading file:", err);
            } else {
              console.log("File uploaded successfully. File ID:", file.data.id);
            }
          }
        );
      }
    }
  );
});



// const { google } = require("googleapis");
// const cron = require("node-cron");
// const { exec } = require("child_process");
// // const fetch = require("node-fetch");
// require("dotenv").config();
// const fs = require("fs");
// const credentials = require("./credentials.json");

// const nameDB = process.env.DATABASE_DB;
// const userDB = process.env.USER_DB;
// const passwordDB = process.env.PASSWORD_DB;
// const hostDB = process.env.HOST_DB;

// // Thời gian backup database mỗi 1 tiếng
// // const backupSchedule = '0 * * * *';
// const backupSchedule = "*/1 * * * *";

// // Đường dẫn tới tệp tin sao lưu database
// const backupFilePath = "backup_db.sql";
// // API key của bạn
// const apiKey = process.env.GOOGLE_API_KEY;
// cron.schedule(backupSchedule, () => {
//   console.log("Starting database backup...");
//   // Thực hiện lệnh backup database ở đây
//   //mysqldump -h ${hostDB} -u ${userDB} -p"${passwordDB}" ${nameDB} > backup_db.sql
//   exec(
//     `mysqldump -h ${hostDB} -u ${userDB} -p"${passwordDB}" ${nameDB} > backup_db.sql`,
//     (error, stdout, stderr) => {
//       if (error) {
//         console.error(`Backup process encountered an error: ${error.message}`);
//       } else {
//         console.log("Database backup completed successfully.");

//         // Đọc nội dung tệp tin sao lưu
//         // const backupFileContent = fs.readFileSync(backupFilePath);

//         // Create an OAuth2 client with the credentials
//         const authClient = new google.auth.OAuth2(
//           credentials.web.client_id,
//           credentials.web.client_secret,
//           credentials.web.redirect_uris[0]
//         );

//         // Set the access token for the client
//         authClient.setCredentials(credentials);

//         // Create a new Drive instance
//         const drive = google.drive({ version: "v3", auth: authClient });

//         // File metadata
//         const fileMetadata = {
//           name: "backupFileContent", // Name of the file
//           parents: ["1bm1c0dJA0MKgIJi1Ryylvoe0zBdWMsYq"], // ID of the destination folder (optional)
//         };

//         // File content
//         const media = {
//           mimeType: "application/sql",
//           body: fs.readFileSync(backupFilePath),
//         };

//         // Upload the file to Google Drive
//         drive.files.create(
//           {
//             resource: fileMetadata,
//             media: media,
//             fields: "id",
//           },
//           (err, file) => {
//             if (err) {
//               console.error("Error uploading file:", err);
//             } else {
//               console.log("File uploaded successfully. File ID:", file.data.id);
//             }
//           }
//         );

//         //   import('node-fetch')
//         //   .then(module => {
//         //     const fetch = module.default;

//         // fetch('https://www.googleapis.com/upload/drive/v3/files?uploadType=media', {
//         //   method: 'POST',
//         //   headers: {
//         //     Authorization: `Bearer ${apiKey}`,
//         //     'Content-Type': 'application/sql',
//         //   },
//         //   body: backupFileContent,
//         // })
//         //   .then((response) => response.json())
//         //   .then((data) => {
//         //     console.log(data);
//         //     console.log('Backup uploaded to Google Drive with ID:', data.id);
//         //   })
//         //   .catch((error) => {
//         //     console.log(error);
//         //     console.error('Error uploading backup to Google Drive:', error);
//         //   });
//         // })
//         // Tạo tệp tin trên Google Drive
//       }
//     }
//   );
// });
