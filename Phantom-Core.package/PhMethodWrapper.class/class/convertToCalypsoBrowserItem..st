calypso
convertToCalypsoBrowserItem: aPhMethodWrapper 
	| item |
	item := ClyBrowserItem named: aPhMethodWrapper selector with: aPhMethodWrapper.
	item addProperty: (ClyMethodDefinitionProperty of: aPhMethodWrapper).
	^item