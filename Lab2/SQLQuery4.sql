CREATE TABLE "���������"(
    "���_����������" NVARCHAR(255) NOT NULL,
    "�����" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "���������" ADD CONSTRAINT "���������_���_����������_primary" PRIMARY KEY("���_����������");
CREATE TABLE "�����"(
    "��������_������" NVARCHAR(255) NOT NULL,
    "����������_�����������" INT NOT NULL,
    "����������_�����_��������" INT NOT NULL
);
ALTER TABLE
    "�����" ADD CONSTRAINT "�����_��������_������_primary" PRIMARY KEY("��������_������");
CREATE TABLE "���"(
    "���_����������" NVARCHAR(255) NOT NULL,
    "��������_������" NVARCHAR(255) NOT NULL,
    "��������" NVARCHAR(255) NOT NULL,
    "����" DATE NOT NULL,
    "�����������_�����" INT NOT NULL
);
ALTER TABLE
    "���" ADD CONSTRAINT "���_��������_������_primary" PRIMARY KEY("��������_������");
ALTER TABLE
    "���" ADD CONSTRAINT "���_���_����������_foreign" FOREIGN KEY("���_����������") REFERENCES "���������"("���_����������");
ALTER TABLE
    "���������" ADD CONSTRAINT "���������_�����_foreign" FOREIGN KEY("�����") REFERENCES "�����"("��������_������");