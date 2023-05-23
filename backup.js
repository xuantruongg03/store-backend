const { google } = require("googleapis");
const cron = require("node-cron");
const { exec } = require("child_process");
const mysqldump = require('mysqldump');
const fs = require("fs");
require("dotenv").config();

const nameDB = process.env.DATABASE_DB;
const userDB = process.env.USER_DB;
const passwordDB = process.env.PASSWORD_DB;
const hostDB = process.env.HOST_DB;
const apiKey = process.env.GOOGLE_API_KEY;
const access_token = process.env.GOOGLE_ACCESS_TOKEN;
const refresh_token = process.env.GOOGLE_REFRESH_TOKEN;
const client_id = process.env.GOOGLE_CLIENT_ID;
const client_secret = process.env.GOOGLE_TOKEN_SECRET;
const redirect_uris = process.env.GOOGLE_REDIRECT_URIS;
//backup 1 tiếng 1 lần
const backupSchedule = "0 * * * *";
const backupFilePath = "backup_db.sql";

const oauth2Client = new google.auth.OAuth2(
  client_id,
    client_secret,
    redirect_uris
);
oauth2Client.setCredentials({
  refresh_token: refresh_token,
  access_token: access_token,
});

cron.schedule(backupSchedule, () => { 
    mysqldump({
        connection: {
          host: hostDB,
          user: userDB,
          password: passwordDB,
          database: nameDB
        },
        dumpToFile: backupFilePath
      }).then(() => {
        console.log('Backup completed');
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
      }).catch((error) => {
        console.error('Backup failed', error);
      });
//   exec(
//     `mysqldump -h ${hostDB} -u ${userDB} -p"${passwordDB}" ${nameDB} > ${backupFilePath}`,
//     (error, stdout, stderr) => {
//       if (error) {
//         console.error(`Backup process encountered an error: ${error.message}`);
//       } else {
//         console.log("Database backup completed successfully.");
        // const drive = google.drive({ version: "v3", auth: oauth2Client });

        // let date = new Date();
        // const name = `backup_db_${date.getDate()}_${date.getMonth()}_${date.getFullYear()}_${date.getHours()}_${date.getMinutes()}_${date.getSeconds()}.sql`;
        // const fileMetadata = {
        //   name: name,
        //   parents: ["1bm1c0dJA0MKgIJi1Ryylvoe0zBdWMsYq"],
        // };

        // const media = {
        //   mimeType: "application/sql",
        //   body: fs.createReadStream(backupFilePath),
        // };

        // drive.files.create(
        //   {
        //     resource: fileMetadata,
        //     media: media,
        //     fields: "id",
        //   },
        //   (err, file) => {
        //     if (err) {
        //       console.error("Error uploading file:", err);
        //     } else {
        //       console.log("File uploaded successfully. File ID:", file.data.id);
        //     }
        //   }
        // );
//       }
//     }
//   );
});
