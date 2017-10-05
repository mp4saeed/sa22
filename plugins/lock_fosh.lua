-----my_name_is_ehsan*#ربات میخای بیا پی وی
👇👇
-----@Saee_d_28     saeed
-----لطفا پیام بالا رو پاک نکنید
local function pre_process(msg)
	local chkfosh = redis:hget('settings:fosh',msg.chat_id_)
	if not chkfosh then
		redis:hset('settings:fosh',msg.chat_id_,'off')
	end
end

local function run(msg, matches)
	--Commands --دستورات فعال و غیرفعال کردن فحش

	if matches[1]:lower() == 'unlock' then
		if matches[2]:lower() == 'fosh' then
			if not is_mod(msg) then return end
			local fosh = redis:hget('settings:fosh',msg.chat_id_)
			if fosh == 'on' then 
				redis:hset('settings:fosh',msg.chat_id_,'off')
				return '*Fosh Hash Been* `Unlocked`'
			elseif fosh == 'off' then
				return '*Fosh Is Already* `Unlocked`'
			end
		end
	end
	if matches[1]:lower() == 'lock' then
		if matches[2]:lower() == 'fosh' then
			if not is_mod(msg) then return end
			local fosh = redis:hget('settings:fosh',msg.chat_id_)
			if fosh == 'off' then 
				redis:hset('settings:fosh',msg.chat_id_,'on')
				return '*Fosh Hash Been* `Locked`'
			elseif fosh == 'on' then
				return '*Fosh Is Already* `Locked`'
			end
		end
	end
	
	--Delete words contains --حذف پیامهای فحش
	if not is_mod(msg) then
		local fosh = redis:hget('settings:fosh',msg.chat_id_)
		if fosh == 'on' then 
			tdcli.deleteMessages(msg.chat_id_, {[0] = msg.id_}, dl_cb, nil)	
		end
	end
end
 
return {
  patterns = {
    "(ک*س)$",
    "کیر",
	"کص",
	"کــــــــــیر",
	"کــــــــــــــــــــــــــــــیر",
	"کـیـــــــــــــــــــــــــــــــــــــــــــــــــــر",
    "ک×یر",
	"ک÷یر",
	"ک*ص",
	"کــــــــــیرر",
    "kir",
	"kos",
	"گوساله",
	"gosale",
	"gusale",
	"جاکش",
	"قرمساق",
	"دیوس",
	"دیوص",
	"dayus",
	"dayos",
	"dayu3",
	"10yus",
	"10yu3",
	"daus",
	"dau3",
	"تخمی",
	"حرومزاده",
	"حروم زاده",
	"harumzade",
	"haromzade",
	"haroomzade",
	"lashi",
	"لاشی",
	"لاشي",
	"جنده",
	"jende",
	"tokhmi",
	"madarjende",
	"kharkosde",
	"خارکسده",
	"خوارکسده",
	"خارکصده",
	"خوارکصده",
	"kharko3de",
	"مادرجنده",

	--Commands ##Don't change this##
	"^[!/#]([Ll][Oo][Cc][Kk]) (.*)$",
	"^[!/#]([Uu][Nn][Ll][Oo][Cc][Kk]) (.*)$",
	------------End----------------
  },
  run = run,
  pre_process = pre_process
}

-----my_name_is_ehsan*#ربات میخای بیا پی وی
👇👇
-----@Saee_d_28     saeed
-----لطفا پیام بالا رو پاک نکنید
