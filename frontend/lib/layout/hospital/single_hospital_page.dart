import 'package:flutter/material.dart';

class HospitalDetailPage extends StatelessWidget {
  final Map<String, dynamic> hospital;

  const HospitalDetailPage({
    super.key,
    required this.hospital,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hospital['name'] ?? 'Hospital Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hospital['name'] ?? '',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          hospital['address'] ?? '',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 16),
                        _buildInfoRow(Icons.phone, hospital['phone'] ?? ''),
                        const SizedBox(height: 8),
                        _buildInfoRow(Icons.email, hospital['email'] ?? ''),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Operating Hours',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(hospital['hours'] ?? '24/7'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              // Details Section
              Text(
                'About',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Text(
                hospital['description'] ?? 'No description available.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 32),

              // Services Section
              Text(
                'Services',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              _buildServicesList(hospital['services'] ?? []),
              
              // Facilities Section
              const SizedBox(height: 32),
              Text(
                'Facilities',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              _buildFacilitiesGrid(hospital['facilities'] ?? []),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }

  Widget _buildServicesList(List<dynamic> services) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: const Icon(Icons.medical_services),
            title: Text(services[index].toString()),
          ),
        );
      },
    );
  }

  Widget _buildFacilitiesGrid(List<dynamic> facilities) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3,
      ),
      itemCount: facilities.length,
      itemBuilder: (context, index) {
        return Card(
          child: Center(
            child: ListTile(
              leading: const Icon(Icons.local_hospital),
              title: Text(
                facilities[index].toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        );
      },
    );
  }
}