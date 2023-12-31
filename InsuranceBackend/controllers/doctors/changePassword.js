import Doctors from "../../models/doctorModel.js"
import joi from "joi"
import passwordComplexity from "joi-password-complexity"
import bcrypt from "bcrypt"
import dotenv from "dotenv"
dotenv.config()

export async function changePassword(req, res) {
	try {
		const doctor = await Doctors.findById(req.params.id)
		if (!doctor) {
			return res.status(404).send({ message: "doctor not found" })
		}
		const validPassword = await bcrypt.compare(
			req.body.oldPassword,
			doctor.password
		)
		if (!validPassword) {
			return res.status(401).send({ message: "Invalid password!" })
		}
		const { error } = validate({ password: req.body.newPassword })
		if (error) {
			return res.status(400).send({ message: error.details[0].message })
		}
		const salt = await bcrypt.genSalt(Number(process.env.SALT))
		const hash = await bcrypt.hash(req.body.newPassword, salt)
		await Doctors.findByIdAndUpdate(req.params.id, { password: hash })
		res.status(200).send({ message: "Password Changed succesfully" })
	} catch (err) {
		console.log(err.message)
		res.status(500).json({ message: err.message })
	}
}

const validate = (data) => {
	const schema = joi.object({
		password: passwordComplexity().required().label("password"),
	})
	return schema.validate(data)
}