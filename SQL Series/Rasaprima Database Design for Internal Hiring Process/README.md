The following portfolio is an assignment given by Govokasi Indonesia with the Objective and Key Result of Human Resource Information System (HRIS) Design. Specifically, I designed the database and EER Diagram for the internal hiring process based on the assumptions and business context of PT. Rasaprima Sukses Makmur.

### Company Profile.
#### - Company Name: PT. Rasaprima Sukses Makmur
#### - Company Website: https://www.rasaprima.co.id
#### - Business Model: Business to Business (B2B)
#### - Industry: Food & Beverage Services
#### - Products/Services: Seasonings, Chili Sauce, Frozen Food, and OEM.

### Competitors.
#### - PT. Sumber Inti Pangan
#### - SBC Foods Indonesia
#### - PT. Sasa Inti

### Company & Comptetitor Comparisons.
| Criteria | PT. Rasaprima Sukses Makmur | PT. Sasa Inti | PT. Sumber Inti Pangan | SBC Foods Indonesia |
| ---------| --------------------------- | ------------- | ---------------------- | ------------------- |
| Industry | Food & Beverage Services | Food Ingredients/Seasonings & Sauces | Food Ingredients/Seasoning Manufacturing | Custom Sauces & Condiments Manufacturing |
| Business Model | B2B (Maklon & OEM for Seasonings, Sambal) | B2B (Retail, Horeca, and Industrial Supply) | B2B (Ingredient supplier, Custom Seasoning) | B2B (Custom Food Solutions, Maklon Service) |
| Location | South Jakarta, DKI Jakarta | Cikarang (HQ), with Jakarta distribution | Tangerang (Greater Jakarta) | Central Jakarta |
| Core Products | Seasonings, Chili Sauce, Frozen Food | Seasonings, Instant Spices, Coconut Milk, Sambal | Powdered Blends, Liquid Seasoning, Flavoring | Sauces, Marinades, Dressings (Custom Recipes) |
| Maklon/Private Label Services | ✅ Yes | ✅ Yes (limited but possible) | ✅ Yes | ✅ Yes (core offering) |
| Customization Capabilities | ✅ High (tailored formulations) | ⚠️ Medium (standardized product lines) | ✅ High (custom spice formulations) | ✅ Very High (R&D-based product development) |
| Certifications (BPOM/HALAL) | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes |
| Scale of Production | Small to Mid-scale | Large-scale national brand | Mid-scale industrial supplier | Small to Mid-scale (flexible batch sizes) |
| Target Clients | Food brands, Restaurants, Horeca, OEM | Supermarkets, Horeca, Export, Industrial B2B | Food Manufacturers, Horeca, Processed Food | Restaurants, Hotels, Food Startups |
| Innovation/R&D | ✅ In-house R&D for formulation | ⚠️ Limited to core R&D | ✅ Basic R&D for flavor development | ✅ Advanced R&D for client projects |
| Product Flexibility | ✅ High (custom options per client) | ⚠️ Low–Medium (mostly fixed SKUs) | ✅ Medium–High | ✅ Very High |
| Key Competitive Advantage | Custom Maklon with flexible batch sizes | Strong national brand, wide distribution | Ingredient expertise & customization | Tailored small-batch, premium customization |


### Ideas & Execution Plan.
#### - Build a conceptual design (flowchart + database structure) for a job vacancy application system tailored to PT. Rasaprima Sukses Makmur's Business Context & Assumptions.
#### - An efficient and scalable recruitment process is critical as businesses expand into new segments and locations.
#### - Support internal hiring for logistics hubs, production lines, and office operations in South Jakarta and Jambi.
#### - Swimlane Flowchart (Process Design) & EER (Database Design).

### Based on the Ideas & Execution Plan that the business context and assumptions of PT. Rasaprima Sukses Makmur will expand its business to new segments and locations, then the relevant positions that will be open vacancies are:
| Area | Segment Focus | Role Suggestions | Placements | Total Candidates |
| ---- | ------------- | ---------------- | ---------- | ---------------- |
| South Jakarta | OEM/Maklon (HQ) | Production Manager, QA Officer, Procurement, HR Admin | South Jakarta | 20 |
| Central Jakarta | Horeca Segment | Key Account Executive, Sales Manager, Customer Service | South Jakarta | 15 |
| North Jakarta | Distribution Hub | Warehouse Staff, Logistics Coordinator | South Jakarta | 10 |
| East Jakarta | OEM Expansion | QC Staff, Machine Operator | South Jakarta | 10 |
| West Jakarta | OEM Expansion | Production Support, Inventory Staff | South Jakarta | 10 |
| Jambi | OEM Entry Point | Field Sales, Junior Technician | Jambi | 15 |

### For EER Diagram, here are the cardinality between tables.
#### - 1 location many job vacancies.
#### - 1 hr user will manage many job vacancies and interviews.
#### - 1 interview type (online) for many interviews.
#### - 1 job vacancy many applications.
#### - 1 job category many job vacancies.
#### - 1 application many interviews.
#### - 1 applicant only for 1 application.
