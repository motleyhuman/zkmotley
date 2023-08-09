import { BasePage } from "./base.page";
import { Helper } from "../helpers/helper";

import type { ICustomWorld } from "../support/custom-world";
let selector: string;

export class ContactsPage extends BasePage {
  constructor(world: ICustomWorld) {
    super(world);
  }

  get sendBtnModal() {
    return "//*[@class='modal-card']//a[contains(@href, '/transaction/send?address=')]";
  }

  get contactsPageContent() {
    return "//*[@class='app-layout-main']";
  }

  get editBtnModal() {
    return "//*[@class='buttons-line-group']//button[1]";
  }

  get savedContact() {
    return "your-account";
  }

  get modalCard() {
    return "//*[@class='modal-card']";
  }

  get addContactButton() {
    return "//*[@class='line-button-with-img-body']";
  }

  get headerTextModal() {
    return `${this.modalCard}//div[text()='Add contact']`;
  }

  async contactNameModal(contactName: string) {
    return `${this.modalCard}//div[text()='${contactName}']`;
  }

  async addressModal(address: string) {
    return `${this.modalCard}//div[text()='${address}']`;
  }

  async contactItem(contactName: string) {
    return `${this.contactsPageContent}//div[text()='${contactName}']`;
  }

  async fillContactFields(inputFieldName: string, text: string) {
    const helper = new Helper(this.world);
    if (
      inputFieldName == "Name of the contact" ||
      inputFieldName == "Ethereum address" ||
      inputFieldName == "Address or ENS or contact name" ||
      inputFieldName == "Symbol or address"
    ) {
      selector = `//*[@placeholder="${inputFieldName}"]`;
      if (text === "clipboard") {
        const result = await helper.getClipboardValue();
        await this.fill(selector, result);
      }
      await this.world.page?.fill(selector, text);
    } else {
      return console.error("An incorrect value of the input field has been provided");
    }
  }

  async pressSendBtnModal() {
    await this.click(this.sendBtnModal);
  }

  async pressEditBtnModal() {
    await this.click(this.editBtnModal);
  }

  async pressRemoveBtnModal(removeButtonText: string) {
    await this.clickByText(removeButtonText);
  }

  async getContactItem(contactName: string) {
    const result = await this.contactItem(contactName);
    const selector = await this.world.page?.locator(result);
    return selector;
  }

  async clickAddButton() {
    await this.click(this.addContactButton);
  }

  async clickOnSavedContact() {
    await this.click(this.savedContact, true);
  }
}