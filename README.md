# RotavirusModel
This is an SIR model on the effect of climate change and daily vaccination rate on the incidence of rotavirus infection in children.

This model captures the dynamics of rotavirus infection in children. It is a classical SIR model based on differential equations with two extra compartments:

* A __vaccinated__ compartment including individuals who have been vaccinated
* A __maternal immunity__ compartment including individuals who retain maternal immunity through breastfeeding.

This model is structured in 5 age groups as follows:

* 0-182 days old
* 183-365 days old
* 366-730 days old
* 731-1095 days old
* 1096-2190 days old

Children over the age of 2190 days (6 years) are assumed not to manifest symptoms of the infection and leave the system.

Each time step is equivalent to 1 day. In addition, climate change is modeled as a sinusoidal wave with periodicity equal to 1 year.
