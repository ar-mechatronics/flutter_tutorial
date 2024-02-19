import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late final Map<String, String> _input;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _input = {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.account_circle),
                hintText: 'Enter your full name',
                helperText: 'All capital letters',
              ),
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.characters,
              maxLength: 120,
              onSaved: (value) => _input['name'] = value!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Address',
                prefixIcon: Icon(Icons.location_city),
                hintText: 'Enter your address',
                helperText: 'No/unit, block, street, city',
              ),
              keyboardType: TextInputType.streetAddress,
              textCapitalization: TextCapitalization.words,
              maxLines: 4,
              maxLength: 300,
              onSaved: (value) => _input['address'] = value!,
            ),
            const SizedBox(height: 16),
            FormField<DateTime>(
              builder: (state) {
                return TextField(
                  decoration: const InputDecoration(
                    labelText: 'Date of birth',
                    prefixIcon: Icon(Icons.cake),
                    hintText: 'Enter your date of birth',
                  ),
                  readOnly: true,
                  onTap: () async {
                    final dateOfBirth = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900, 1, 1),
                      lastDate: DateTime.now(),
                    );
                    state.didChange(dateOfBirth);
                  },
                  maxLength: 120,
                );
              },
              onSaved: (value) => _input['dateOfBirth'] = value.toString(),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Gender',
                prefixIcon: Icon(Icons.wc),
                hintText: 'Select your gender',
              ),
              items: const [
                DropdownMenuItem(value: 'M', child: Text('Male')),
                DropdownMenuItem(value: 'F', child: Text('Female'))
              ],
              onChanged: (value) {},
              onSaved: (value) => _input['gender'] = value!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone number',
                prefixIcon: Icon(Icons.phone),
                hintText: 'Enter your phone number',
                helperText: 'Format: 10 or 11 digit, starting with 0',
              ),
              maxLength: 20,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a phone number';
                }

                if (!RegExp(r'^0\d{9,10}$').hasMatch(value)) {
                  return 'Invalid phone number';
                }

                return null;
              },
              onSaved: (value) => _input['phone'] = value!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                hintText: 'Enter your email',
              ),
              keyboardType: TextInputType.emailAddress,
              maxLength: 120,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email address';
                }

                if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Invalid email address';
                }

                return null;
              },
              onSaved: (value) => _input['email'] = value!,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.password),
                hintText: 'Enter your password',
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              maxLength: 80,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }

                if (value.length < 6) {
                  return 'Must be 6 characters or more';
                }

                return null;
              },
              onSaved: (value) => _input['password'] = value!,
            ),
            const Divider(
              height: 48,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('View terms & conditions'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final form = _formKey.currentState!;

                if (form.validate()) {
                  form.save();
                  print(_input);
                }
              },
              child: const Text('Register account'),
            ),
          ],
        ),
      ),
    );
  }
}
