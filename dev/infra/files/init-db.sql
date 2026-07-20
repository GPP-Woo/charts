-- Shared postgres init for the unified GPP-Woo stack.
-- The .NET apps (odpc/odbp) auto-create their own databases (ODPC/ODBP) via EF
-- migrations, so only the Django/OpenZaak databases need to exist up front.

-- woo_publications (ODRC / GPP-publicatiebank)
CREATE USER woo_publications;
CREATE DATABASE woo_publications WITH OWNER woo_publications;

-- woo_search (GPP-zoeken)
CREATE USER woo_search;
CREATE DATABASE woo_search WITH OWNER woo_search;

-- openzaak
CREATE USER openzaak;
CREATE DATABASE openzaak WITH OWNER openzaak;
