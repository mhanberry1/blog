# incentivised distributed storage

So I've been thinking a lot lately about creating a crowd-sourced version of Google Drive or Microsoft OneDrive.

## what's the appeal?

So the biggest issue with giving a company your data is that you have to put all of your trust in that company. A number of things could go wrong here:

* The company could go bankrupt
* An unauthorized user could steal your data
* Your data could be (and probably is) sold for a profit

Using an open system would provide transparency so that you can feel confident that your data isn't being mishandled or abused. Crowd-sourcing this solution will also provide redundancy so that your data won't just evaporate one day. After all, open standards can't just go out of business like a company can. If you don't believe me, just consider how the bittorrent protocol continues to thrive despite countless anti-piracy takedown attempts.

## doesn't this exist already?

Almost. IPFS is a technology that allows people to offer up their machines for crowd-sourced storage, but it comes with no incentive and no guarantee. This means that you are relying on strangers to offer up their computer to you out of the good of their heart. While I may believe that people are inherently good, I don't think that it would be a good idea to gamble with your data. Another quirk of IPFS is that your data will *only* be replicated **if** it is downloaded by other people on the network! That's not great if you're using it to back up important information...

What makes my system different is that users would receive a monetary kickback for hosting your data, and the amount they are awarded will scale based on the speed of their connection, how much data they are storing, etc. Also, your data will be guaranteed to be available on at least 2 systems at any given time.

## features & technical considerations

* People would be paid to host data on their computer, and they would pay to have their data hosted by other users
	* Pay is based on the amount of data that is stored on a user's system and how often data is pulled from that system
	* Internally, users would pay and be paid using a crypto utility token. A distributed ledger would keep track of payments. The use of a token unique to this system is necessary to ensure autonomy and resiliency.
	* Endpoint services could be created to abstract away the token altogether so that users can deal in fiat currency exclusively.
* Admin servers and load-balancers will be needed to distribute data and traffic effectively
	* These admin servers will keep track of active servers, connection strength, and will ensure that a user's data is always accessible on at least 2 servers.
	* If a server becomes unavailable, the data that was on that system will be replicated to another server to ensure redundancy. Data parity will be tracked and maintained as well.
	* Admins could be selected based on a combination of factors such as how long they have been a part of the system, and how much data they store
* All data must be encrypted before being transmitted and stored.
	* Endpoint services could be created to abstract away key management for users.
