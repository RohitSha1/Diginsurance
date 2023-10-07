import { Router } from "express"
const router = Router()
import authVerify from "../middlewares/authVerify.js"
import { getAdmins } from "../controllers/admins/getAdmins.js"
import { updateAdmin } from "../controllers/admins/updateAdmin.js"
import { deleteAdmin } from "../controllers/admins/deleteAdmin.js"
import { adminLogin } from "../controllers/admins/adminLogin.js"
import { getSubAdmins } from "../controllers/admins/getSubAdmins.js"
import { changePassword } from "../controllers/admins/changePassword.js"
import registerAdmin from "../controllers/admins/registerAdmin.js"
import multer from "multer"
import { v2 as cloudinary } from "cloudinary"
import { CloudinaryStorage } from "multer-storage-cloudinary"

const storage = new CloudinaryStorage({
	cloudinary: cloudinary,
	params: {
		folder: "Profile",
	},
})



const upload = multer({ storage: storage })

router.post('/', upload.single("image"),registerAdmin)

router.post("/login",  adminLogin)

router.get("/", getAdmins)

router.get("/admins",  getSubAdmins)

router.put("/:id",  updateAdmin)

router.put("/changepassword/:id",  changePassword)

router.delete("/:id",  deleteAdmin)

export default router