// 基本的な設定
const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
const db = admin.firestore();
// AWS
const AWS = require("aws-sdk");
const AWS_REGION = "ap-northeast-1";

function updateAWSConfig() {
    AWS.config.update({
        accessKeyId: process.env.AWS_ACCESS_KEY,
        secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
        region: AWS_REGION,
    });
}
async function moderateImage(image) {
    updateAWSConfig();
    const rekognition = new AWS.Rekognition();
    const bucketName = image["bucketName"];
    const fileName = image["fileName"];
    if (!bucketName || !fileName) {
        return image;
    }
    try {
        const params = {
            Image: {
                S3Object: {
                    Bucket: bucketName,
                    Name: fileName,
                }
            },
            MinConfidence: 60,
        };
        const response = await rekognition.detectModerationLabels(params).promise();
        const result = {
            "bucketName": bucketName,
            "moderationLabels": response.ModerationLabels,
            "moderationModelVersion": response.ModerationModelVersion ,
            "fileName": fileName,
        }
        return result;
    } catch(e) {
        let newImage = image;
        newImage["error"] = e.message;
        return image;
    }
}
exports.onUserUpdateLogCreate = functions
.runWith({secrets: ["AWS_ACCESS_KEY","AWS_SECRET_ACCESS_KEY"]})
.firestore
.document("public_users/{uid}/user_update_logs/{log_id}").onCreate(
    async (snap,_) => {
        const data = snap.data();
        const moderatedImage = await moderateImage(data['image']);
        await db.collection('public_users').doc(data["uid"]).update({
            "name": data["name"],
            "image": moderatedImage,
        });
    }
);