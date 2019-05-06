USE [TSSDB]
GO
/****** Object:  Trigger [dbo].[deneme]    Script Date: 6.05.2019 16:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER trigger [dbo].[deneme] on [dbo].[MalKabul]
for insert
as
begin

declare  
	    @MaliyetKS float, @TeslimatKS float, @KaliteKS float, @MemnuniyetKS float

		select @MaliyetKS = isnull((select FloatDeger from Ayarlar where Anahtar ='MaliyetKS' ),0.5)
		select @KaliteKS = isnull((select FloatDeger from Ayarlar where Anahtar ='KaliteKS' ),0.5)
		select @TeslimatKS = isnull((select FloatDeger from Ayarlar where Anahtar ='TeslimatKS' ),0.5)
		select @MemnuniyetKS = isnull((select FloatDeger from Ayarlar where Anahtar ='MemnuniyetKS' ),0.5)
		
		 
	    create table #TempGruplaStokKodTed([StokKodu] varchar(10), [TedarikciId] int , [MaliyetPuan] smallint , [KalitePuan] smallint, 
			 								[TeslimatPuan] smallint, [MemnuniyetPuan] smallint, [Adet] int) 
		 --drop table #TempGruplaStokKodTed
		
		
    insert into #TempGruplaStokKodTed( [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan],[Adet] ) 
	select [StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Adet] 
	   from inserted  	
	   	  
	  
	update #TempGruplaStokKodTed set MaliyetPuan = (MaliyetPuan * 0.8)+10,	
								     KalitePuan = (KalitePuan * 0.8)+10,
								     TeslimatPuan = (TeslimatPuan * 0.8)+10,
								     MemnuniyetPuan = (MemnuniyetPuan * 0.8)+10

--select * from #TempGruplaStokKodTed
   
   --select distinct StokKodu into #temp from #TempGruplaStokKodTed  
  --  select * from #Temp 
--	 --return

--De�i�kenlerin tan�mlanmas� i�lemi

DECLARE 
 	@StokKodu varchar(10), @TedId int ,@MaliyetPuan float , @KalitePuan float, 
 	@TeslimatPuan float, @MemnuniyetPuan float,@Adet int

--En d��taki cursor'un tan�mlanmas� i�lemi
DECLARE CursorStokKodu CURSOR
FOR
     select distinct StokKodu   
	 from #TempGruplaStokKodTed  
	  
--Cursor'un a��lmas� i�lemi (En d��taki)
OPEN CursorStokKodu
--Cursor ile sat�r sat�r CursorStokKodu i�inde gezinip stokkodu de�erlerinin al�nmas�
FETCH NEXT FROM CursorStokKodu INTO @StokKodu
--D�ng� ba�l�yor
WHILE @@FETCH_STATUS = 0
 BEGIN
	   --��teki cursor'un tan�mlanmas� i�lemi
        DECLARE CursorTedId CURSOR FOR
		    --Cursor ile sotokkodu de�erinin d��taki sorgudan al�n�p i�eride d�n�lmesi i�lemi
            SELECT  TedarikciId,MaliyetPuan,KalitePuan, TeslimatPuan, MemnuniyetPuan, Adet
            FROM  #TempGruplaStokKodTed
            WHERE   StokKodu = @StokKodu

         --Cursor'un a��lmas� i�lemi (��teki)
        OPEN CursorTedId
		--Burada cursor i�eride stokkoda g�re d�n�p tedidyi al�yor.
        FETCH NEXT FROM CursorTedId INTO @TedId,@MaliyetPuan , @KalitePuan , @TeslimatPuan , @MemnuniyetPuan ,@Adet
		--D�ng� ba�l�yor
     WHILE @@FETCH_STATUS = 0
         BEGIN

			--ya� alg burda yap�lcak

			if(exists(select * from UrunTedarikci where StokKodu =@StokKodu and TedarikciId = @TedId))
			begin
				declare @Ortid int, @OrtMaliyet float , @OrtKalite float, @OrtTeslimat float ,@OrtMaliyetAgirlik float,
						@OrtKaliteAgirlik float ,@OrtTeslimatAgirlik float, @OrtAdetE float
				
				select @Ortid=id, @OrtMaliyet =MaliyetPuan, @OrtKalite=KalitePuan, @OrtTeslimat=TeslimatPuan ,
						@OrtMaliyetAgirlik= MaliyetAgirlik ,@OrtKaliteAgirlik=KaliteAgirlik , @OrtTeslimatAgirlik= KaliteAgirlik
					from UrunTedarikci where StokKodu =@StokKodu and TedarikciId = @TedId	

					set @OrtAdetE = @OrtMaliyetAgirlik 
					set @OrtMaliyetAgirlik = @OrtAdetE * @MaliyetKS +1
			   		set @OrtMaliyet = (@OrtMaliyet * @OrtAdetE * @MaliyetKS + @MaliyetPuan)/(@OrtMaliyetAgirlik)

					
					set @OrtAdetE = @OrtKaliteAgirlik 
					set @OrtKaliteAgirlik = @OrtAdetE * @KaliteKS +1
			   		set @OrtKalite = (@OrtKalite * @OrtAdetE * @KaliteKS + @KalitePuan)/(@OrtKaliteAgirlik)
					
					set @OrtAdetE = @OrtTeslimatAgirlik 
					set @OrtTeslimatAgirlik = @OrtAdetE * @TeslimatKS +1
			   		set @OrtTeslimat = (@OrtTeslimat * @OrtAdetE * @TeslimatKS + @TeslimatPuan)/(@OrtTeslimatAgirlik)

					update UrunTedarikci set MaliyetPuan=@OrtMaliyet  , KalitePuan= @OrtKalite , TeslimatPuan= @OrtTeslimat ,MaliyetAgirlik= @OrtMaliyetAgirlik ,
											KaliteAgirlik= @OrtKaliteAgirlik  ,TeslimatAgirlik= @OrtTeslimatAgirlik 
							  where id=@Ortid

			end
			else
			begin
				insert UrunTedarikci ( [StokKodu], [TedarikciId], [MaliyetPuan], [MaliyetAgirlik], [KalitePuan], [KaliteAgirlik], [TeslimatPuan], [TeslimatAgirlik] )
				        values(@StokKodu, @TedId,@MaliyetPuan ,1, @KalitePuan ,1, @TeslimatPuan ,1)

			end
				
			-- bu sat�rdan a��as� tedarikci tablosuna ( tedid2 ler tedarikci tablosundaki id alan� o sat�ra update �ekmek i�in a��ada kullan�caz) 
				declare @TedId2 int, @TedMemnuniyet float ,@TedMemnuniyetAgirlik float,@TedAdetE float
				
				select @TedId2=id, @TedMemnuniyet =Memnuniyet, @TedMemnuniyetAgirlik=MemnuniyetAgirlik--tabloda onceden olan kay�tlar� ald�k
					from Tedarikci where id = @TedId	
				
				 set @TedAdetE = @TedMemnuniyetAgirlik  --ald�m�z kay�tlara ya�land�rma alg uygulad�k
				 set @TedMemnuniyetAgirlik = @TedAdetE * @MemnuniyetKS +1
			     set @TedMemnuniyet = (@TedMemnuniyet * @TedAdetE * @MemnuniyetKS + @MemnuniyetPuan)/(@TedMemnuniyetAgirlik)
				 update Tedarikci set Memnuniyet=@TedMemnuniyet  , MemnuniyetAgirlik= @TedMemnuniyetAgirlik -- hesaplanm�� verileri update �ektik
				   where id=@TedId2
				-- tedid2 ler tedarikci tablosu	   

                FETCH NEXT FROM CursorTedId INTO @TedId,@MaliyetPuan , @KalitePuan , @TeslimatPuan , @MemnuniyetPuan ,@Adet
            END

	    --��teki cursor'un kapat�lmas�
        CLOSE CursorTedId;
        DEALLOCATE CursorTedId;
        FETCH NEXT FROM CursorStokKodu INTO @StokKodu
 END
--D��taki cursor'un kapat�lmas�
CLOSE CursorStokKodu;
DEALLOCATE CursorStokKodu;
 

end


--
--
--delete from UrunTedarikci
--delete from MalKabul
--update Tedarikci set Memnuniyet = 50, MemnuniyetAgirlik=1
--
-- insert into Malkabul ([StokKodu], [TedarikciId], [MaliyetPuan], [KalitePuan], [TeslimatPuan], [MemnuniyetPuan], [Tarih], [Adet]  )
-- values ('D002',2 ,10,100,10,50,null,40),('D002',1,70,100,100,100,null,30),
--  ('P01',3 ,90,80,100,0,null,40),('D001',3,90,80,100,0,null,30),
--   ('D003',3 ,90,80,50,50,null,40),('D001',2,90,80,50,50,null,30)

