=begin
** Form generated from reading ui file 'create_bottle_dialog.ui'
**
** Created: Sat Jan 14 22:50:16 2012
**      by: Qt User Interface Compiler version 4.7.4
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_CreateBottleDialog
    attr_reader :gridLayout
    attr_reader :horizontalLayout_3
    attr_reader :chooseIconButton
    attr_reader :verticalLayout
    attr_reader :horizontalLayout
    attr_reader :label
    attr_reader :nameEntry
    attr_reader :horizontalLayout_2
    attr_reader :label_2
    attr_reader :urlEntry
    attr_reader :verticalSpacer
    attr_reader :buttonBox

    def setupUi(createBottleDialog)
    if createBottleDialog.objectName.nil?
        createBottleDialog.objectName = "createBottleDialog"
    end
    createBottleDialog.resize(462, 213)
    @sizePolicy = Qt::SizePolicy.new(Qt::SizePolicy::Fixed, Qt::SizePolicy::Preferred)
    @sizePolicy.setHorizontalStretch(0)
    @sizePolicy.setVerticalStretch(0)
    @sizePolicy.heightForWidth = createBottleDialog.sizePolicy.hasHeightForWidth
    createBottleDialog.sizePolicy = @sizePolicy
    @gridLayout = Qt::GridLayout.new(createBottleDialog)
    @gridLayout.objectName = "gridLayout"
    @horizontalLayout_3 = Qt::HBoxLayout.new()
    @horizontalLayout_3.spacing = 16
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @chooseIconButton = Qt::PushButton.new(createBottleDialog)
    @chooseIconButton.objectName = "chooseIconButton"
    @sizePolicy1 = Qt::SizePolicy.new(Qt::SizePolicy::Minimum, Qt::SizePolicy::MinimumExpanding)
    @sizePolicy1.setHorizontalStretch(0)
    @sizePolicy1.setVerticalStretch(0)
    @sizePolicy1.heightForWidth = @chooseIconButton.sizePolicy.hasHeightForWidth
    @chooseIconButton.sizePolicy = @sizePolicy1
    @chooseIconButton.minimumSize = Qt::Size.new(150, 0)
    @chooseIconButton.iconSize = Qt::Size.new(128, 128)

    @horizontalLayout_3.addWidget(@chooseIconButton)

    @verticalLayout = Qt::VBoxLayout.new()
    @verticalLayout.spacing = 16
    @verticalLayout.objectName = "verticalLayout"
    @horizontalLayout = Qt::HBoxLayout.new()
    @horizontalLayout.objectName = "horizontalLayout"
    @label = Qt::Label.new(createBottleDialog)
    @label.objectName = "label"

    @horizontalLayout.addWidget(@label)

    @nameEntry = Qt::LineEdit.new(createBottleDialog)
    @nameEntry.objectName = "nameEntry"
    @sizePolicy2 = Qt::SizePolicy.new(Qt::SizePolicy::Preferred, Qt::SizePolicy::Fixed)
    @sizePolicy2.setHorizontalStretch(0)
    @sizePolicy2.setVerticalStretch(0)
    @sizePolicy2.heightForWidth = @nameEntry.sizePolicy.hasHeightForWidth
    @nameEntry.sizePolicy = @sizePolicy2
    @nameEntry.minimumSize = Qt::Size.new(200, 0)

    @horizontalLayout.addWidget(@nameEntry)


    @verticalLayout.addLayout(@horizontalLayout)

    @horizontalLayout_2 = Qt::HBoxLayout.new()
    @horizontalLayout_2.objectName = "horizontalLayout_2"
    @label_2 = Qt::Label.new(createBottleDialog)
    @label_2.objectName = "label_2"

    @horizontalLayout_2.addWidget(@label_2)

    @urlEntry = Qt::LineEdit.new(createBottleDialog)
    @urlEntry.objectName = "urlEntry"
    @sizePolicy2.heightForWidth = @urlEntry.sizePolicy.hasHeightForWidth
    @urlEntry.sizePolicy = @sizePolicy2
    @urlEntry.minimumSize = Qt::Size.new(200, 0)

    @horizontalLayout_2.addWidget(@urlEntry)


    @verticalLayout.addLayout(@horizontalLayout_2)

    @verticalSpacer = Qt::SpacerItem.new(20, 40, Qt::SizePolicy::Minimum, Qt::SizePolicy::Expanding)

    @verticalLayout.addItem(@verticalSpacer)


    @horizontalLayout_3.addLayout(@verticalLayout)


    @gridLayout.addLayout(@horizontalLayout_3, 0, 0, 1, 1)

    @buttonBox = Qt::DialogButtonBox.new(createBottleDialog)
    @buttonBox.objectName = "buttonBox"
    @buttonBox.orientation = Qt::Horizontal
    @buttonBox.standardButtons = Qt::DialogButtonBox::Cancel|Qt::DialogButtonBox::Ok

    @gridLayout.addWidget(@buttonBox, 1, 0, 1, 1)

    buttonBox.raise()
    chooseIconButton.raise()
    label.raise()
    nameEntry.raise()
    label_2.raise()
    urlEntry.raise()
    label.raise()
    urlEntry.raise()

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
    @chooseIconButton.text = ''
    @label.text = Qt::Application.translate("CreateBottleDialog", "Name:", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("CreateBottleDialog", "URL:", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(createBottleDialog)
        retranslateUi(createBottleDialog)
    end

end

module Ui
    class CreateBottleDialog < Ui_CreateBottleDialog
    end
end  # module Ui

