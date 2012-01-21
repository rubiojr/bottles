// Gmail Unread Message Count and Notifications for Bottles (bottles.frameos.org)
// based on the script from Eric Bogs http://userscripts.org/scripts/show/39432
//

// How often to attempt to update the favicon.  Change this to a larger number
// if your Firefox browsing becomes sluggish.
var pollDurationMS = 5000;

if (!window.bottlejs) {
    alert('This script has been coded for Bottles (http://bottles.frameos.org)');
}

function GmailFavIconUnreadCount() {
    this.inboxSpan_ = null;
    this.getInboxSpan_ = function() {
        var frame = top.document.getElementById('canvas_frame')
        if (frame) {
            this.inboxSpan_ = frame.contentWindow.document.getElementsByClassName('n0')[0];
        }
        return this.inboxSpan_;
    }

    this.poll_ = function() {
        self.checkCount_(self.getInboxSpan_().textContent);
    }

    this.checkCount_ = function(inboxText) {
        // Parses the "Inbox (5)" text.
        matches = inboxText.match(/\((\d+)\)/);

        // If unable to parse, assumes 0 unread.
        count = matches ? parseInt(matches[1], 10) : 0;

        // Change the favicon only if the unread message count has
        // changed, or if the new chat status has changed.
        if (this.lastCount_ != count) {
            var index;
            if (count > 98) {
                index = 22; // "99+"
            } else if (count > 49) {
                index = 21; // "50+"
            } else if (count > 19) {
                index = 20; // "20+"
            } else {
                index = count;
            }

            // Set the status/count, so we can compare next time.
            this.lastCount_ = count;
            if (count != 0) { 
                bottlejs.notify("New Email", "You have " + count + " unread emails.");
            }
            bottlejs.launcher_entry_count(count);

        }
    };

    // Needed to circumvent Greasemonkey problems with "this"-scoping.
    var self = this;
    this.lastCount_ = -1;
    this.inboxSpan_ = null;
    this.head_ = top.document.getElementsByTagName("head")[0];

    var user_email_div = top.document.getElementsByClassName('msg')[0];
    var user_email = user_email_div ? user_email_div.innerHTML : "";

    // Checks every second for a change in the unread count.
    var timer = setInterval(this.poll_, pollDurationMS);
    this.poll_();

    return true;
}

var initialized = false;

function initialize() {
    if (!initialized) {
        // Timeout needed to ensure gmail API object is fully initialized.
        bottlejs.debug("initializing gmail");
        initialized = new GmailFavIconUnreadCount();
    }
}

window.addEventListener('load', function() {
    if (window.bottlejs) {
        initialize();
    }
}, true);
