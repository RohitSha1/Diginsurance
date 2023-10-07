import Admin from "../../models/adminModel.js";
import joi from "joi"
import passwordComplexity from "joi-password-complexity"
import bcrypt from "bcrypt"
import dotenv from "dotenv"
dotenv.config()

export async function registerAdmin(req, res) {
	try {
		console.log('req')
		let adminData = {
			name: req.body.name,
			email: req.body.email,
			password: req.body.password,
			qualification: req.body.qualification,
			department: req.body.department,
			experience: req.body.experience,
			expertise: req.body.expertise,
			image: req.file ? req.file.path : req.body.image,
		}
		const { error } = validate(adminData)
		if (error) {
			console.log(error.message)
			return res.status(400).send({ message: error.details[0].message })
		}

		const admin = await Admin.findOne({ email: req.body.email })
		if (admin)
			return res
				.status(409)
				.send({ message: "Admin with this email already exist!" })

		const salt = await bcrypt.genSalt(10)
		const hashPassword = await bcrypt.hash(req.body.password, salt)


		await new Admin({
			...adminData,
			password: hashPassword,
			role: "admin",
			access: true,
		}).save()
		res.status(201).send({ message: "Admin created succesfully" })
	} catch (err) {
		console.log(err.message)
		res.status(500).json({ message: err.message })
	}
}

const validate = (data) => {
	const schema = joi.object({
		name: joi.string().label("name"),
		email: joi.string().required().label("email"),
		password: passwordComplexity().label("password"),
		qualification: joi.number().required().label("qualification"),
		department: joi.string().required().label("department"),
		experience: joi.string().required().label("experience"),
		expertise: joi.string().label("expertise"),
		image: joi.allow("image"),
	})
	return schema.validate(data)
}
// import bcrypt from "bcrypt";

// const registerAdmin = async (req, res) => {
//   try {
//     console.log(req.body);
//     const salt = await bcrypt.genSalt(10);
//     const hashPassword = await bcrypt.hash(req.body.password, salt);

//     await new Admin({
//       name: req.body.name,
//       email: req.body.email,
//       password: req.body.password,
//       qualification: req.body.qualification,
//       department: req.body.department,
//       experience: req.body.experience,
//       expertise: req.body.expertise,
//       image: req.file ? req.file.path : req.body.image,
//     }).save();

//     res.status(200).send({ message: "admin created" });
//   } catch (err) {
//     console.log(err.message);
//     res.status(500).send({ message: err.message });
//   }
// };

export default registerAdmin;

