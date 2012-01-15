=begin
** Form generated from reading ui file 'create_bottle_dialog.ui'
**
** Created: Sun Jan 15 18:01:27 2012
**      by: Qt User Interface Compiler version 4.7.4
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_CreateBottleDialog
    attr_reader :gridLayout
    attr_reader :label_4
    attr_reader :horizontalLayout_3
    attr_reader :verticalLayout_2
    attr_reader :chooseIconButton
    attr_reader :verticalLayout
    attr_reader :horizontalLayout
    attr_reader :label
    attr_reader :nameEntry
    attr_reader :horizontalLayout_2
    attr_reader :label_2
    attr_reader :urlEntry
    attr_reader :label_3
    attr_reader :listWidget
    attr_reader :buttonBox

    def setupUi(createBottleDialog)
    if createBottleDialog.objectName.nil?
        createBottleDialog.objectName = "createBottleDialog"
    end
    createBottleDialog.resize(462, 492)
    @sizePolicy = Qt::SizePolicy.new(Qt::SizePolicy::Fixed, Qt::SizePolicy::Preferred)
    @sizePolicy.setHorizontalStretch(0)
    @sizePolicy.setVerticalStretch(0)
    @sizePolicy.heightForWidth = createBottleDialog.sizePolicy.hasHeightForWidth
    createBottleDialog.sizePolicy = @sizePolicy
    @gridLayout = Qt::GridLayout.new(createBottleDialog)
    @gridLayout.objectName = "gridLayout"
    @gridLayout.setContentsMargins(16, 16, 16, 9)
    @label_4 = Qt::Label.new(createBottleDialog)
    @label_4.objectName = "label_4"
    @label_4.margin = 0

    @gridLayout.addWidget(@label_4, 0, 0, 1, 1)

    @horizontalLayout_3 = Qt::HBoxLayout.new()
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @horizontalLayout_3.sizeConstraint = Qt::Layout::SetDefaultConstraint
    @horizontalLayout_3.setContentsMargins(-1, -1, -1, 16)
    @verticalLayout_2 = Qt::VBoxLayout.new()
    @verticalLayout_2.objectName = "verticalLayout_2"
    @chooseIconButton = Qt::PushButton.new(createBottleDialog)
    @chooseIconButton.objectName = "chooseIconButton"
    @sizePolicy1 = Qt::SizePolicy.new(Qt::SizePolicy::Minimum, Qt::SizePolicy::Minimum)
    @sizePolicy1.setHorizontalStretch(0)
    @sizePolicy1.setVerticalStretch(0)
    @sizePolicy1.heightForWidth = @chooseIconButton.sizePolicy.hasHeightForWidth
    @chooseIconButton.sizePolicy = @sizePolicy1
    @chooseIconButton.minimumSize = Qt::Size.new(150, 150)
    @chooseIconButton.iconSize = Qt::Size.new(128, 128)

    @verticalLayout_2.addWidget(@chooseIconButton)


    @horizontalLayout_3.addLayout(@verticalLayout_2)

    @verticalLayout = Qt::VBoxLayout.new()
    @verticalLayout.spacing = 16
    @verticalLayout.objectName = "verticalLayout"
    @horizontalLayout = Qt::HBoxLayout.new()
    @horizontalLayout.objectName = "horizontalLayout"
    @label = Qt::Label.new(createBottleDialog)
    @label.objectName = "label"
    @sizePolicy2 = Qt::SizePolicy.new(Qt::SizePolicy::Minimum, Qt::SizePolicy::Preferred)
    @sizePolicy2.setHorizontalStretch(0)
    @sizePolicy2.setVerticalStretch(0)
    @sizePolicy2.heightForWidth = @label.sizePolicy.hasHeightForWidth
    @label.sizePolicy = @sizePolicy2
    @label.minimumSize = Qt::Size.new(60, 0)
    @label.alignment = Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter

    @horizontalLayout.addWidget(@label)

    @nameEntry = Qt::LineEdit.new(createBottleDialog)
    @nameEntry.objectName = "nameEntry"
    @sizePolicy3 = Qt::SizePolicy.new(Qt::SizePolicy::Preferred, Qt::SizePolicy::Fixed)
    @sizePolicy3.setHorizontalStretch(0)
    @sizePolicy3.setVerticalStretch(0)
    @sizePolicy3.heightForWidth = @nameEntry.sizePolicy.hasHeightForWidth
    @nameEntry.sizePolicy = @sizePolicy3
    @nameEntry.minimumSize = Qt::Size.new(200, 0)

    @horizontalLayout.addWidget(@nameEntry)


    @verticalLayout.addLayout(@horizontalLayout)

    @horizontalLayout_2 = Qt::HBoxLayout.new()
    @horizontalLayout_2.objectName = "horizontalLayout_2"
    @label_2 = Qt::Label.new(createBottleDialog)
    @label_2.objectName = "label_2"
    @sizePolicy2.heightForWidth = @label_2.sizePolicy.hasHeightForWidth
    @label_2.sizePolicy = @sizePolicy2
    @label_2.minimumSize = Qt::Size.new(60, 0)
    @label_2.alignment = Qt::AlignRight|Qt::AlignTrailing|Qt::AlignVCenter

    @horizontalLayout_2.addWidget(@label_2)

    @urlEntry = Qt::LineEdit.new(createBottleDialog)
    @urlEntry.objectName = "urlEntry"
    @sizePolicy3.heightForWidth = @urlEntry.sizePolicy.hasHeightForWidth
    @urlEntry.sizePolicy = @sizePolicy3
    @urlEntry.minimumSize = Qt::Size.new(200, 0)

    @horizontalLayout_2.addWidget(@urlEntry)


    @verticalLayout.addLayout(@horizontalLayout_2)


    @horizontalLayout_3.addLayout(@verticalLayout)


    @gridLayout.addLayout(@horizontalLayout_3, 1, 0, 1, 1)

    @label_3 = Qt::Label.new(createBottleDialog)
    @label_3.objectName = "label_3"

    @gridLayout.addWidget(@label_3, 2, 0, 1, 1)

    @listWidget = Qt::ListWidget.new(createBottleDialog)
    @listWidget.objectName = "listWidget"
    @font = Qt::Font.new
    @font.pointSize = 16
    @listWidget.font = @font
    @listWidget.iconSize = Qt::Size.new(32, 32)
    @listWidget.spacing = 2

    @gridLayout.addWidget(@listWidget, 3, 0, 1, 1)

    @buttonBox = Qt::DialogButtonBox.new(createBottleDialog)
    @buttonBox.objectName = "buttonBox"
    @buttonBox.orientation = Qt::Horizontal
    @buttonBox.standardButtons = Qt::DialogButtonBox::Cancel|Qt::DialogButtonBox::Ok

    @gridLayout.addWidget(@buttonBox, 4, 0, 1, 1)


    retranslateUi(createBottleDialog)
    Qt::Object.connect(@buttonBox, SIGNAL('accepted()'), createBottleDialog, SLOT('accept()'))
    Qt::Object.connect(@buttonBox, SIGNAL('rejected()'), createBottleDialog, SLOT('reject()'))

    Qt::MetaObject.connectSlotsByName(createBottleDialog)
    end # setupUi

    def setup_ui(createBottleDialog)
        setupUi(createBottleDialog)
    end

    def retranslateUi(createBottleDialog)
    createBottleDialog.windowTitle = Qt::Application.translate("CreateBottleDialog", "Create Bottle", nil, Qt::Application::UnicodeUTF8)
    @label_4.text = Qt::Application.translate("CreateBottleDialog", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'Ubuntu'; font-size:11pt; font-weight:400; font-style:normal;\">\n" \
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">Bottle Icon</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @chooseIconButton.text = Qt::Application.translate("CreateBottleDialog", "Icon", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("CreateBottleDialog", "Name:", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("CreateBottleDialog", "URL:", nil, Qt::Application::UnicodeUTF8)
    @label_3.text = Qt::Application.translate("CreateBottleDialog", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'Ubuntu'; font-size:11pt; font-weight:400; font-style:normal;\">\n" \
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:12pt; font-weight:600;\">Select from Template</span></p>\n" \
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:10pt;\">Create a new bottle or select one of the templates below</span></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(createBottleDialog)
        retranslateUi(createBottleDialog)
    end

end

module Ui
    class CreateBottleDialog < Ui_CreateBottleDialog
    end
end  # module Ui

