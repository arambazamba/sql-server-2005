


_menuCloseDelay=200           // The time delay for menus to remain visible on mouse out
_menuOpenDelay=100            // The time delay before menus open on mouse over
_followSpeed=5                // Follow scrolling speed
_followRate=50                // Follow scrolling Rate
_subOffsetTop=5               // Sub menu top offset
_subOffsetLeft=-10            // Sub menu left offset
_scrollAmount=3               // Only needed for Netscape 4.x
_scrollDelay=20               // Only needed for Netcsape 4.x



with(menuStyle=new mm_style()){
onbgcolor="#4F8EB6";
oncolor="#ffffff";
offbgcolor="#DCE9F0";
offcolor="#515151";
bordercolor="#296488";
borderstyle="solid";
borderwidth=1;
separatorcolor="#2D729D";
separatorsize="1";
padding=5;
fontsize="75%";
fontstyle="normal";
fontfamily="Verdana, Tahoma, Arial";
pagecolor="black";
pagebgcolor="#82B6D7";
headercolor="#000000";
headerbgcolor="#ffffff";
subimage="/include/arrow.gif";
subimagepadding="2";
overfilter="Fade(duration=0.2);Alpha(opacity=90);Shadow(color='#777777', Direction=135, Strength=5)";
outfilter="randomdissolve(duration=0.1)";
}


with(milonic=new menuname("Store")){
style=menuStyle;
overflow="scroll";
aI("text=Store;url=/store;");
}
with(milonic=new menuname("Resources")){
style=menuStyle;
overflow="scroll";
aI("text=Articles;url=/articles;");
aI("text=Scripts;url=/Scripts;");
aI("text=Question of the Day;url=/testcenter/qod.asp;");
aI("text=Test Center;url=/testcenter;");
aI("text=Newsletter Archive;url=/newsletter;");
aI("text=Discussion Forums;url=/Forum;");
aI("text=Email Lists;url=/other/discussionlists.asp;");
aI("text=FAQs;url=/faq;");
aI("text=Resource Center;url=/rc/;");
aI("text=The SQL Server Standard Magazine;url=http://www.sqlserverstandard.com;");
aI("text=Store;url=/store;");
aI("text=Products and Books;url=/products;");
aI("text=Links;url=/other/links.asp;");
aI("text=Free Technology Magazines;url=http://sqlservercentral.tradepub.com/;");
aI("text=Columnists;url=/columnists;");
aI("text=Event Calendar;url=/forum/events.asp;");
aI("text=Contest;url=/contest;");
}

with(milonic=new menuname("Articles")){
style=menuStyle;
aI("text=SQL Server;url=/articles/articleList.asp?categoryid=2;");
aI("text=T-SQL;url=/articles/articleList.asp?categoryid=3;");
aI("text=XML;url=/articles/articleList.asp?categoryid=4;");
aI("text=Programming;url=/articles/articleList.asp?categoryid=5;");
aI("text=Strategies;url=/articles/articleList.asp?categoryid=6;");
aI("text=Database Design;url=/articles/articleList.asp?categoryid=7;");
aI("text=Business Intelligence;url=/articles/articleList.asp?categoryid=8;");
aI("text=Career;url=/articles/articleList.asp?categoryid=9;");
aI("text=Reviews;url=/articles/articleList.asp?categoryid=10;");
aI("text=Other;url=/articles/articleList.asp?categoryid=11;");
aI("text=Most Popular;url=/articles/poparticles.asp;");
}

with(milonic=new menuname("About Us")){
style=menuStyle;
aI("text=About SQLServerCentral.com;url=/other/AboutUs.asp;");
aI("text=Link to Us;url=/other/linktous.asp;");
aI("text=Write For Us;url=/other/writeforus.asp;");
aI("text=Obtaining a Review;url=/community/reviews.asp;");
aI("text=Advertise;url=/other/advertise.asp;");
aI("text=Contact Us;url=/other/contact.asp;");
aI("text=Terms of Use;url=/other/terms.asp;");
aI("text=Privacy;url=/other/privacy.asp;");
aI("text=Testimonials;url=/other/testimonials.asp;");
}

with(milonic=new menuname("My Account")){
style=menuStyle;
aI("text=My SQLServerCentral.com Profile;url=/forum/pop_profile.asp?mode=Edit;");
aI("text=Contribution Center;url=/memberservices/contributehome.asp;");
aI("text=Write for SQLServerCentral.com;url=/community/write.asp;");
aI("text=Virtual Briefcase;url=/memberservices/briefcase.asp;");
aI("text=Unsubscribe from Newsletter/Forums;url=/memberservices/unsubscribe.asp;");
aI("text=My Recent Posts;url=/memberservices/recentposts.asp;");


}

drawMenus();

